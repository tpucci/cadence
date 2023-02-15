import 'package:app/features/camera/stores/camera_store.dart';
import 'package:app/ui/ds/colors.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Grid extends StatelessWidget {
  const Grid({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _GridPainter(),
      child: Container(),
    );
  }
}

class _GridPainter extends CustomPainter {
  final _camera = GetIt.I.get<Camera>();

  final _paint = Paint()
    ..style = PaintingStyle.fill
    ..color = background.shade700;
  final _hideBelowRadius = 1.5;
  final _hideAboveRadius = 3;

  double _getOffsetValue(double position, int size, double zoom) {
    final s = size * zoom;
    return position % s;
  }

  Offset _offset(Offset offset, int size, double zoom) {
    return Offset(_getOffsetValue(offset.dx, size, zoom),
        _getOffsetValue(offset.dy, size, zoom));
  }

  double _scale(int size, double zoom) {
    return size * zoom;
  }

  int _repeatCount(double size, int gridSize, double zoom) {
    return (size / gridSize / zoom).ceil();
  }

  void paintDots(Canvas canvas, Size size,
      {required int gridSize, required int dotRadius}) {
    final radius = _scale(dotRadius, _camera.scale);

    if (radius < _hideBelowRadius || radius > _hideAboveRadius) {
      return;
    }

    final linesCount = _repeatCount(size.height, gridSize, _camera.scale);
    final columnsCount = _repeatCount(size.width, gridSize, _camera.scale);

    final offset = _offset(_camera.offset, gridSize, _camera.scale);
    final gap = _scale(gridSize, _camera.scale);

    for (var i = 0; i < linesCount; i++) {
      for (var j = 0; j < columnsCount; j++) {
        canvas.drawCircle(
            Offset((j * gap).toDouble() + offset.dx,
                (i * gap).toDouble() + offset.dy),
            radius,
            _paint);
      }
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    paintDots(canvas, size, gridSize: 512, dotRadius: 16);
    paintDots(canvas, size, gridSize: 256, dotRadius: 8);
    paintDots(canvas, size, gridSize: 128, dotRadius: 4);
    paintDots(canvas, size, gridSize: 64, dotRadius: 2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
