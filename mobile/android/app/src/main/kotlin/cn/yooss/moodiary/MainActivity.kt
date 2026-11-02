package cn.yooss.moodiary

import android.content.ComponentName
import android.content.Intent
import android.content.pm.PackageManager
import android.content.pm.ShortcutInfo
import android.content.pm.ShortcutManager
import android.graphics.BitmapFactory
import android.graphics.drawable.Icon
import android.media.MediaCodecList
import android.os.Build
import android.os.Bundle
import com.ryanheise.audioservice.AudioServiceFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.renderer.FlutterRenderer
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.io.File

class MainActivity : AudioServiceFragmentActivity() {
  private val aliases = mapOf(
    "dream" to "cn.yooss.moodiary.LauncherDream",
    "mono" to "cn.yooss.moodiary.LauncherMono",
    "plum" to "cn.yooss.moodiary.LauncherPlum",
  )
  private val shortcutId = "dream_diary_custom"

  override fun onCreate(savedInstanceState: Bundle?) {
    // Preserve the existing HiSilicon AVC workaround, including API > 29.
    if (Build.VERSION.SDK_INT > 29 && hasHiSiliconAvcDecoder) {
      FlutterRenderer.debugForceSurfaceProducerGlTextures = true
    }
    super.onCreate(savedInstanceState)
  }

  override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    // Register only after the host has provided the engine; onCreate can run
    // before FlutterFragmentActivity's fragment/engine is attached.
    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "dream_diary/launcher")
      .setMethodCallHandler { call, result -> handleLauncher(call, result) }
  }

  private fun component(name: String) = ComponentName(packageName, name)
  private fun enabled(name: String): Boolean {
    val state = packageManager.getComponentEnabledSetting(component(name))
    return state == PackageManager.COMPONENT_ENABLED_STATE_ENABLED ||
      (state == PackageManager.COMPONENT_ENABLED_STATE_DEFAULT && name == aliases["dream"])
  }

  private fun setPreset(preset: String) {
    val target = aliases[preset] ?: throw IllegalArgumentException("Unknown preset")
    val changes = aliases.values.map { name ->
      Pair(component(name), if (name == target) PackageManager.COMPONENT_ENABLED_STATE_ENABLED
        else PackageManager.COMPONENT_ENABLED_STATE_DISABLED)
    }
    if (Build.VERSION.SDK_INT >= 33) {
      // Atomic on modern Android: no missing/duplicate launcher entry window.
      packageManager.setComponentEnabledSettings(
        changes.map { (component, state) ->
          PackageManager.ComponentEnabledSetting(component, state, PackageManager.DONT_KILL_APP)
        },
      )
    } else {
      // Enable first so an interrupted legacy switch never leaves zero entries.
      for ((component, state) in changes.sortedByDescending { it.second == PackageManager.COMPONENT_ENABLED_STATE_ENABLED }) {
        packageManager.setComponentEnabledSetting(component, state, PackageManager.DONT_KILL_APP)
      }
    }
  }

  private fun privateShortcutFile(path: String): File {
    val root = File(filesDir, "dream_diary/launcher").canonicalFile
    val file = File(path).canonicalFile
    require(file.parentFile == root && file.name == "shortcut.png") { "Invalid shortcut path" }
    require(file.isFile && file.length() in 1..(8L * 1024 * 1024)) { "Invalid shortcut image" }
    return file
  }

  private fun handleLauncher(call: MethodCall, result: MethodChannel.Result) {
    try {
      when (call.method) {
        "getPreset" -> result.success(aliases.entries.firstOrNull { enabled(it.value) }?.key ?: "dream")
        "setPreset" -> {
          setPreset(call.argument<String>("preset") ?: throw IllegalArgumentException("preset"))
          result.success(null)
        }
        "pinShortcut" -> {
          val file = privateShortcutFile(call.argument<String>("path") ?: throw IllegalArgumentException("path"))
          val bitmap = BitmapFactory.decodeFile(file.path) ?: throw IllegalArgumentException("Invalid image")
          val manager = getSystemService(ShortcutManager::class.java)
          if (!manager.isRequestPinShortcutSupported) { result.success(false); return }
          val intent = Intent(Intent.ACTION_MAIN).setClass(this, MainActivity::class.java)
            .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP)
          val shortcut = ShortcutInfo.Builder(this, shortcutId)
            .setShortLabel(getString(R.string.app_name))
            .setLongLabel(getString(R.string.app_name))
            .setIcon(Icon.createWithAdaptiveBitmap(bitmap))
            .setIntent(intent).build()
          // Updating an existing pinned shortcut is allowed; a new one needs launcher consent.
          val alreadyPinned = manager.pinnedShortcuts.any { it.id == shortcutId }
          if (alreadyPinned) {
            manager.updateShortcuts(listOf(shortcut))
            result.success(true)
          } else {
            result.success(manager.requestPinShortcut(shortcut, null))
          }
        }
        "isShortcutPinned" -> result.success(
          getSystemService(ShortcutManager::class.java).pinnedShortcuts.any { it.id == shortcutId })
        "disableShortcut" -> {
          getSystemService(ShortcutManager::class.java)
            .disableShortcuts(listOf(shortcutId), getString(R.string.app_name))
          result.success(null)
        }
        else -> result.notImplemented()
      }
    } catch (e: Exception) {
      result.error("launcher_error", e.message, null)
    }
  }

  private val hasHiSiliconAvcDecoder: Boolean by lazy {
    runCatching {
      MediaCodecList(MediaCodecList.REGULAR_CODECS).codecInfos.any { codec ->
        codec.name.contains("hisi", true) &&
          codec.supportedTypes.any { it.equals("video/avc", true) }
      }
    }.getOrDefault(false)
  }
}
