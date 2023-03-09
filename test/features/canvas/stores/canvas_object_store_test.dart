import 'package:app/di.dart';
import 'package:app/features/canvas/stores/canvas_object_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CanvasObjectStore', () {
    late CanvasObject canvasObject;

    setUp(() {
      setupDi(clear: true);
      canvasObject = CanvasObjectStore();
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
  });
}
