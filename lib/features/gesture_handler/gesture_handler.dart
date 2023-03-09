import 'package:app/features/camera/stores/camera_store.dart';
import 'package:app/features/gesture_handler/stores/pointer_store.dart';
import 'package:app/features/gesture_handler/hit_test_permissive_stack.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart' as mobx;

class GestureHandler extends StatefulWidget {
  const GestureHandler({super.key, required this.children});

  final List<Widget> children;

  @override
  State<GestureHandler> createState() => _GestureHandlerState();
}

class _GestureHandlerState extends State<GestureHandler> {
  _GestureHandlerState() {
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

  final _camera = GetIt.I.get<Camera>();

  final _pointer = GetIt.I.get<Pointer>();

  final _transform = ValueNotifier<Matrix4>(Matrix4.identity());

  double? _scaleStart; // Scale value at start of scaling gesture.

  @override
  Widget build(BuildContext context) {
    return Listener(
        behavior: HitTestBehavior.translucent,
        onPointerSignal: (details) {
          if (details is PointerScrollEvent) {
            if (details.scrollDelta.dx == 0 &&
                // FIXME: When pinching, dx equals 0 and dy is a float. But this way of detecting a pinch smells bad.
                details.scrollDelta.dy % 1 != 0) {
              _camera.zoom(
                  fromOffset: details.position,
                  scaleDelta: details.scrollDelta.dy);
            } else {
              _camera.pan(details.scrollDelta);
            }
          }
        },
        onPointerPanZoomStart: (_) {
          _scaleStart = _camera.scale;
        },
        onPointerPanZoomUpdate: (details) {
          _camera.pan(-details.localPanDelta);

          // Handle scale
          _scaleStart ??= details.scale;
          _camera.zoom(
              fromOffset: details.position,
              factor: _scaleStart! * details.scale);
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
            children: widget.children,
          ),
        )));
  }
}
