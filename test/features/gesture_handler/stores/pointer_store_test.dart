import 'package:app/di.dart';
import 'package:app/features/camera/stores/camera_store.dart';
import 'package:app/features/gesture_handler/stores/pointer_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  late Pointer pointer;
  late Camera camera;

  setUp(() {
    setupDi(clear: true);
    pointer = GetIt.I.get<Pointer>();
    camera = GetIt.I.get<Camera>();
  });

  group('PointerStore', () {
    test('it stores the pointer offset', () {
      // Arrange
      const offset = Offset(4, 5);

      // Act
      pointer.setOffset(offset);

      // Assert
      expect(pointer.offset, offset);
    });

    test('it streams the pointer state', () {
      // Arrange
      const downOffset = Offset(4, 5);
      const upOffset = Offset(4, 10);
      const downPointerState =
          PointerState(offset: downOffset, position: PointerPosition.down);
      const upPointerState =
          PointerState(offset: upOffset, position: PointerPosition.up);

      // Assert
      expect(pointer.stateStream,
          emitsInOrder([downPointerState, upPointerState]));

      // Act
      pointer.nextState(downPointerState);
      pointer.nextState(upPointerState);
    });

    test('it stores the pointer offset in the camera scene', () {
      // Arrange
      const panOffset = Offset(6, 8);
      const pointerOffset = Offset(4, 5);

      // Act
      pointer.setOffset(pointerOffset);
      camera.zoom(fromOffset: Offset.zero);
      camera.pan(panOffset);

      // Assert
      expect(pointer.offset, (pointerOffset + panOffset) / camera.scale);
    });
  });
}
