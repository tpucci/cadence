import 'package:app/di.dart';
import 'package:app/features/camera/stores/camera_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test/test.dart';

void main() {
  group('CameraStore', () {
    late Camera camera;

    setUp(() {
      setupDi(clear: true);
      camera = GetIt.I.get<Camera>();
    });

    test('initial offset is zero', () {
      expect(camera.offset, Offset.zero);
    });

    test('pan correctly', () {
      // Arrange
      const scrollDelta = Offset(2, 3);

      // Act
      camera.pan(scrollDelta);

      // Assert
      expect(camera.offset, const Offset(-2, -3));
    });

    test('initial scale is 1', () {
      expect(camera.scale, 1);
    });

    test('zoom correctly', () {
      // Act
      camera.zoom(100, Offset.zero);

      // Assert
      expect(camera.scale, 0.3);
      expect(camera.offset, Offset.zero);
    });

    test('zoom correctly from any offset', () {
      // Act
      camera.zoom(100, const Offset(5, 10));

      // Assert
      expect(camera.scale, 0.3);
      expect(camera.offset, const Offset(3.5, 7));
    });

    test('zoom is clamped', () {
      // Act
      camera.zoom(100000, const Offset(0, 0));

      // Assert
      expect(camera.scale, 0.3);
      // Act
      camera.zoom(-100000, const Offset(0, 0));

      // Assert
      expect(camera.scale, 4);
    });

    test("it zooms by a factor", () {
      // Act
      camera.zoom(0, const Offset(0, 0), factor: 2);

      // Assert
      expect(camera.scale, 2);

      // Act
      camera.zoom(0, const Offset(0, 0), factor: 10000000);

      // Assert
      expect(camera.scale, 4);
    });
  });
}
