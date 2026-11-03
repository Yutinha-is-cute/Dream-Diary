import 'package:moodiary_di/moodiary_di.dart';
import 'package:moodiary_mobile/app/router/router.dart';
import 'package:moodiary_music/moodiary_music.dart';
import 'package:moodiary_storage/moodiary_storage.dart';
import 'package:mui/mui.dart';

class AppLockObserver extends StatefulWidget {
  final Widget child;

  const AppLockObserver({super.key, required this.child});

  @override
  State<AppLockObserver> createState() => _AppLockObserverState();
}

class _AppLockObserverState extends State<AppLockObserver>
    with WidgetsBindingObserver {
  bool _locking = false;
  bool _appPaused = false;

  static const Set<String> _skip = {
    LockRoute.path,
    ShareRoute.path,
    NewDiaryRoute.path,
    DiaryRoute.path,
  };

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    router.routerDelegate.addListener(_onRouteChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) => _onRouteChanged());
  }

  @override
  void dispose() {
    router.routerDelegate.removeListener(_onRouteChanged);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  /// The PIN gate clears by navigating away from [LockRoute]. Re-evaluate the
  /// pending music start on that route change as well as on lifecycle resume.
  void _onRouteChanged() {
    if (!mounted || _appPaused) return;
    final music = getIt.maybeGet<MusicController>();
    if (music == null) return;
    final configuration = router.routerDelegate.currentConfiguration;
    if (configuration.matches.isEmpty) return;
    music.onAppResumed(locked: configuration.uri.path == LockRoute.path);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _appPaused = false;
      _onRouteChanged();
      return;
    }
    if (state != AppLifecycleState.paused && state != AppLifecycleState.hidden) {
      return;
    }
    // Android can emit hidden then paused; only capture the playing state once.
    if (_appPaused) return;
    _appPaused = true;

    final music = getIt.maybeGet<MusicController>();
    if (music != null) {
      music.persistPosition();
      music.onAppPaused();
    }
    if (_locking) return;
    if (!AppLockPin.enabled.value || MoodiaryKVs.lockNow.get() != true) {
      return;
    }
    final location = router.routerDelegate.currentConfiguration.uri.path;
    if (_skip.contains(location)) return;

    _locking = true;
    router
        .pushRoute(const LockRoute(lockType: 'pause'))
        .whenComplete(() => _locking = false);
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
