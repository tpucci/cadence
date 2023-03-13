import 'package:app/di.dart';
import 'package:app/features/canvas/stores/canvas_object_store.dart';
import 'package:app/features/gesture_handler/stores/pointer_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  group('CanvasObjectStore', () {
    late CanvasObject canvasObject;
    late Pointer pointer;

    setUp(() {
      setupDi(clear: true);
      canvasObject = CanvasObjectStore();
      pointer = GetIt.I.get<Pointer>();
    });

    test('it selects', () {
      // Act
      canvasObject.select();

      // Assert
      expect(canvasObject.selected, true);
    });

    test('it unselects', () {
      // Act
      canvasObject.select();
      canvasObject.unselect();

      // Assert
      expect(canvasObject.selected, false);
    });

    test('it toggles selection', () {
      // Act
      canvasObject.select();
      canvasObject.toggleSelection();
      canvasObject.toggleSelection();

      // Assert
      expect(canvasObject.selected, true);
    });

    test('it sets the initial offset', () {
      // Arrange
      const offset = Offset(10, 20);

      // Act
      final co = CanvasObjectStore(offset: offset);

      // Assert
      expect(co.offset, offset);
    });

    test('it moves the issue', () {
      // Arrange
      final co = CanvasObjectStore();
      const expectedOffset = Offset(10, 12);

      // Act
      co.move(expectedOffset);

      // Assert
      expect(co.offset, expectedOffset);
    });

    test('it follows the pointer', () {
      // Arrange
      final co = CanvasObjectStore();
      final initialOffset = co.offset;
      const initialPointerOffset = Offset(23, 54);
      pointer.setOffset(initialPointerOffset);

      // Act
      co.startFollowingPointer();
      const finalPointerOffset = Offset(90, 134);
      pointer.setOffset(finalPointerOffset);

      // Assert
      expect(
          co.offset, initialOffset + finalPointerOffset - initialPointerOffset);
    });

    test('it stops following the pointer', () {
      // Arrange
      final co = CanvasObjectStore();
      final initialOffset = co.offset;
      const initialPointerOffset = Offset(23, 54);
      pointer.setOffset(initialPointerOffset);

      // Act
      co.startFollowingPointer();
      co.stopFollowingPointer();
      const finalPointerOffset = Offset(90, 134);
      pointer.setOffset(finalPointerOffset);

      // Assert
      expect(co.offset, initialOffset);
    });
  });
}
