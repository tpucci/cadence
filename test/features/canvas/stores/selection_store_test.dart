import 'package:app/di.dart';
import 'package:app/features/canvas/stores/canvas_object_store.dart';
import 'package:app/features/canvas/stores/selection_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SelectionStore', () {
    late Selection selection;

    setUp(() {
      setupDi(clear: true);
      selection = SelectionStore();
    });

    test('it adds object to selection', () {
      // Arrange
      final object = CanvasObjectStore();

      // Act
      selection.select(object);

      // Assert
      expect(selection.list, contains(object));
    });

    test('it removes object from selection', () {
      // Arrange
      final object = CanvasObjectStore();

      // Act
      selection.select(object);
      selection.unselect(object);

      // Assert
      expect(selection.list, isEmpty);
    });

    test('it removes all other objects from selection', () {
      // Arrange
      final object1 = CanvasObjectStore();
      final object2 = CanvasObjectStore();

      // Act
      selection.select(object1);
      selection.select(object2);

      // Assert
      expect(selection.list, isNot(contains(object1)));
    });
  });
}
