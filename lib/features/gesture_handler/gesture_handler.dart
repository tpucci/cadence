import 'package:app/features/camera/stores/camera_store.dart';
import 'package:app/features/gesture_handler/stores/pointer_store.dart';
import 'package:app/features/gesture_handler/hit_test_permissive_stack.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart' as mobx;

class GestureHandler extends StatelessWidget {
  GestureHandler({super.key, required this.children}) {
    mobx.reaction((_) => {_camera.offset, _camera.scale}, (_) {
      _transform.value = Matrix4(
        _camera.scale,
        0,
        0,
        0,
        0,
        _camera.scale,
        0,
        0,
        0,
        0,
        _camera.scale,
        0,
        _camera.offset.dx,
        _camera.offset.dy,
        0,
        1,
      );
    }, fireImmediately: true);
  }

  final List<Widget> children;

  final _camera = GetIt.I.get<Camera>();
  final _pointer = GetIt.I.get<Pointer>();

  final _transform = ValueNotifier<Matrix4>(Matrix4.identity());

  @override
  Widget build(BuildContext context) {
    InteractiveViewer.builder;
    return Listener(
        behavior: HitTestBehavior.translucent,
        onPointerSignal: (details) {
          if (details is PointerScrollEvent) {
            if (details.scrollDelta.dx == 0 &&
                // FIXME: When pinching, dx equals 0 and dy is a float. But this way of detecting a pinch smells bad.
                details.scrollDelta.dy % 1 != 0) {
              _camera.zoom(details.scrollDelta.dy, details.position);
            } else {
              _camera.pan(details.scrollDelta);
            }
          }
        },
        onPointerDown: (event) {
          _pointer.nextState(PointerState(
              offset: event.position, position: PointerPosition.down));
        },
        onPointerUp: (event) {
          _pointer.nextState(PointerState(
              offset: event.position, position: PointerPosition.up));
        },
        onPointerHover: (event) {
          _pointer.setOffset(event.position);
        },
        onPointerMove: (event) {
          _pointer.setOffset(event.position);
        },
        child: SizedBox.expand(
            child: AnimatedBuilder(
          animation: _transform,
          builder: (context, child) =>
              Transform(transform: _transform.value, child: child),
          child: HitTestPermissiveStack(
            clipBehavior: Clip.none,
            children: children,
          ),
        )));
  }
}
