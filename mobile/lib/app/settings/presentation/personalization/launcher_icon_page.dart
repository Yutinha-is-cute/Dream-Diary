import 'dart:io';
import 'dart:ui' as ui;

import 'package:moodiary_components/moodiary_components.dart';
import 'package:moodiary_di/moodiary_di.dart';
import 'package:moodiary_files/moodiary_files.dart';
import 'package:moodiary_i18n/moodiary_i18n.dart';
import 'package:moodiary_logging/moodiary_logging.dart';
import 'package:moodiary_mobile/app/settings/presentation/personalization/icon_crop.dart';
import 'package:moodiary_mobile/app/settings/presentation/personalization/launcher_icon_channel.dart';
import 'package:moodiary_platform/moodiary_platform.dart';
import 'package:moodiary_storage/moodiary_storage.dart';
import 'package:mui/mui.dart';
import 'package:path/path.dart' as p;

class LauncherIconPage extends StatefulWidget {
  const LauncherIconPage({super.key});
  @override State<LauncherIconPage> createState() => _LauncherIconPageState();
}

class _LauncherIconPageState extends State<LauncherIconPage> {
  final _channel = const LauncherIconChannel();
  String _preset = MoodiaryKVs.launcherIcon.get()!;
  bool _busy = false, _pinned = false, _circleMask = false, _monochrome = false;

  @override void initState() {
    super.initState();
    _refresh();
  }

  Future<void> _refresh() async {
    try {
      final preset = await _channel.getPreset();
      final pinned = await _channel.isShortcutPinned();
      if (!mounted) return;
      // Reconcile a failed/interrupted switch with the real PackageManager state.
      if (LauncherIconChannel.presets.contains(preset)) MoodiaryKVs.launcherIcon.set(preset);
      setState(() { _preset = preset; _pinned = pinned; });
    } catch (e, s) { _error(e, s); }
  }

  void _error(Object e, StackTrace s) {
    logger.e('launcher icon operation failed', error: e, stackTrace: s);
    if (mounted) toast.error(message: context.l10n.dream.iconError);
  }

  Future<void> _apply(String preset) async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      await _channel.setPreset(preset);
      MoodiaryKVs.launcherIcon.set(preset);
      if (!mounted) return;
      setState(() => _preset = preset);
      toast.success(message: context.l10n.dream.iconApplied);
    } catch (e, s) { _error(e, s); }
    finally { if (mounted) setState(() => _busy = false); }
  }

  Future<void> _pickCustom() async {
    if (_busy) return;
    try {
      final file = await getIt<IFilePicker>().pickFile(allowedExtensions: ['png', 'jpg', 'jpeg', 'webp']);
      if (file == null || !mounted) return;
      if (await file.length() > 20 * 1024 * 1024) {
        if (mounted) toast.error(message: context.l10n.dream.iconTooLarge);
        return;
      }
      final bytes = await file.readAsBytes();
      final codec = await ui.instantiateImageCodec(bytes, targetWidth: 1024);
      final frame = await codec.getNextFrame();
      codec.dispose();
      if (!mounted) { frame.image.dispose(); return; }
      final crop = IconCrop(imageWidth: frame.image.width.toDouble(), imageHeight: frame.image.height.toDouble());
      final result = await showDialog<IconCrop>(context: context,
        builder: (_) => _CropDialog(image: frame.image, initial: crop));
      frame.image.dispose();
      if (result == null || !mounted) return;
      setState(() => _busy = true);
      // Decode again for export because the dialog disposes its preview image.
      final exportCodec = await ui.instantiateImageCodec(bytes, targetWidth: 1024);
      final exportFrame = await exportCodec.getNextFrame();
      try {
        final png = await renderIconCrop(exportFrame.image, result);
        final dir = Directory(p.join(PlatformService.get().applicationSupportPath, 'dream_diary', 'launcher'));
        await dir.create(recursive: true);
        final destination = File(p.join(dir.path, 'shortcut.png'));
        final tmp = File('${destination.path}.tmp');
        await tmp.writeAsBytes(png, flush: true);
        await tmp.rename(destination.path);
        final accepted = await _channel.pinShortcut(destination.path);
        if (!mounted) return;
        setState(() => _pinned = accepted);
        toast.success(message: accepted ? context.l10n.dream.shortcutRequested : context.l10n.dream.shortcutDeclined);
      } finally { exportFrame.image.dispose(); exportCodec.dispose(); }
    } catch (e, s) { _error(e, s); }
    finally { if (mounted) setState(() => _busy = false); }
  }

  Future<void> _removeShortcut() async {
    final ok = await MAlert.confirm(context, title: context.l10n.dream.shortcutRemove,
      message: context.l10n.dream.shortcutRemoveMessage, isDestructive: true);
    if (!ok || !mounted) return;
    try {
      await _channel.disableShortcut();
      final file = File(p.join(PlatformService.get().applicationSupportPath, 'dream_diary', 'launcher', 'shortcut.png'));
      if (await file.exists()) await file.delete();
      if (mounted) setState(() => _pinned = false);
    } catch (e, s) { _error(e, s); }
  }

  @override Widget build(BuildContext context) {
    final t = context.l10n.dream;
    return Scaffold(appBar: AppBar(title: Text(t.iconTitle)), body: ListView(
      padding: const EdgeInsets.all(16), children: [
        Text(t.iconDescription, style: context.theme.typography.bodyMedium.onSurfaceVariant),
        const SizedBox(height: 20),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          for (final entry in {'dream': t.iconDream, 'mono': t.iconMono, 'plum': t.iconPlum}.entries)
            _Preset(image: 'assets/brand/icon_${entry.key}.png', label: entry.value,
              selected: _preset == entry.key, monochrome: _monochrome, circle: _circleMask,
              onTap: _busy ? null : () => _apply(entry.key)),
        ]),
        const SizedBox(height: 12),
        SwitchListTile(title: Text(t.iconMaskPreview), value: _circleMask,
          onChanged: (v) => setState(() => _circleMask = v)),
        SwitchListTile(title: Text(t.iconMonochromePreview), subtitle: Text(t.iconMonochromeHint),
          value: _monochrome, onChanged: (v) => setState(() => _monochrome = v)),
        if (_busy) const LinearProgressIndicator(),
        const SizedBox(height: 12),
        OutlinedButton.icon(onPressed: _busy ? null : () => _apply('dream'),
          icon: const Icon(LucideIcons.rotateCcw), label: Text(t.iconRestore)),
        const Divider(height: 40),
        SettingTitleTile(title: t.shortcutTitle, subtitle: t.shortcutDescription),
        FilledButton.icon(onPressed: _busy ? null : _pickCustom,
          icon: const Icon(LucideIcons.imagePlus), label: Text(t.shortcutCreate)),
        if (_pinned) TextButton.icon(onPressed: _removeShortcut,
          icon: const Icon(LucideIcons.trash2), label: Text(t.shortcutRemove)),
        const SizedBox(height: 12),
        Text(t.shortcutLimit, style: context.theme.typography.bodySmall.onSurfaceVariant),
      ],
    ));
  }
}

class _Preset extends StatelessWidget {
  const _Preset({required this.image, required this.label, required this.selected,
    required this.monochrome, required this.circle, this.onTap});
  final String image, label;
  final bool selected, monochrome, circle;
  final VoidCallback? onTap;
  @override Widget build(BuildContext context) => InkWell(onTap: onTap,
    borderRadius: BorderRadius.circular(16), child: Padding(padding: const EdgeInsets.all(8),
      child: Column(children: [
        Container(padding: const EdgeInsets.all(3), decoration: BoxDecoration(
          shape: BoxShape.circle, border: Border.all(width: 2,
            color: selected ? context.theme.colors.primary : Colors.transparent)),
          child: _IconImage(image: image, circle: circle, monochrome: monochrome, size: 64)),
        const SizedBox(height: 8), Text(label),
        if (selected)
          Icon(LucideIcons.check, size: 16, color: context.theme.colors.primary),
      ])));
}

class _IconImage extends StatelessWidget {
  const _IconImage({required this.image, required this.circle, required this.monochrome, required this.size, });
  final String image; final bool circle, monochrome; final double size;
  @override Widget build(BuildContext context) {
    Widget child = Image.asset(image, width: size, height: size, fit: BoxFit.cover);
    if (monochrome) {
      child = ColorFiltered(colorFilter: const ColorFilter.matrix([
        .2126,.7152,.0722,0,0, .2126,.7152,.0722,0,0, .2126,.7152,.0722,0,0, 0,0,0,1,0,
      ]), child: child);
    }
    return ClipRRect(borderRadius: BorderRadius.circular(circle ? size / 2 : size * .22), child: child);
  }
}

class _CropDialog extends StatefulWidget {
  const _CropDialog({required this.image, required this.initial});
  final ui.Image image; final IconCrop initial;
  @override State<_CropDialog> createState() => _CropDialogState();
}
class _CropDialogState extends State<_CropDialog> {
  late IconCrop _crop = widget.initial;
  bool _circle = false;
  @override Widget build(BuildContext context) {
    const side = 280.0;
    return AlertDialog(title: Text(context.l10n.dream.iconCropTitle), content: SizedBox(width: side,
      child: SingleChildScrollView(child: Column(mainAxisSize: MainAxisSize.min, children: [
        GestureDetector(onPanUpdate: (d) => setState(() => _crop = _crop.moved(d.delta.dx, d.delta.dy, side)),
          child: ClipRRect(borderRadius: BorderRadius.circular(_circle ? side / 2 : 24),
            child: SizedBox(width: side, height: side, child: CustomPaint(painter: _CropPainter(widget.image, _crop))))),
        Slider(value: _crop.zoom, min: 1, max: 4, onChanged: (v) => setState(() => _crop = _crop.zoomed(v))),
        Row(children: [Checkbox(value: _circle, onChanged: (v) => setState(() => _circle = v ?? false)),
          Expanded(child: Text(context.l10n.dream.iconMaskPreview))]),
        Text(context.l10n.dream.iconCropHint, style: context.theme.typography.bodySmall.onSurfaceVariant),
      ]))), actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text(context.l10n.common.cancel)),
        FilledButton(onPressed: () => Navigator.pop(context, _crop), child: Text(context.l10n.dream.shortcutCreate)),
      ]);
  }
}
class _CropPainter extends CustomPainter {
  _CropPainter(this.image, this.crop); final ui.Image image; final IconCrop crop;
  @override void paint(Canvas canvas, Size size) {
    canvas.drawImageRect(image, crop.sourceRect, Offset.zero & size, Paint());
  }
  @override bool shouldRepaint(_CropPainter old) => old.crop != crop || old.image != image;
}
