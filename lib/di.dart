import 'package:app/features/camera/stores/camera_store.dart';
import 'package:app/features/canvas/stores/selection_store.dart';
import 'package:app/features/demo/demo_fixtures.dart';
import 'package:app/features/gesture_handler/stores/pointer_store.dart';
import 'package:app/features/issues/stores/issues_store.dart';
import 'package:get_it/get_it.dart';

/// **Setup the application DI.**
///
/// Set `clear: true` to reset type definitions. Usefull for tests !
/// Example:
/// ```dart
///     setUp(() {
///      setupDi(clear: true);
///      camera = GetIt.I.get<Camera>();
///    });
/// ```
///
void setupDi({bool clear = false, bool demo = false}) {
  if (clear) {
    GetIt.instance.reset();
  }
  GetIt getIt = GetIt.instance;

  getIt.registerSingleton<Camera>(CameraStore());
  getIt.registerSingleton<IssuesStore>(MobxIssuesStore());
  getIt.registerSingleton<Pointer>(PointerStore());
  getIt.registerSingleton<Selection>(SelectionStore());

  if (demo) {
    getIt.registerSingleton(DemoFixtures());
  }
}
