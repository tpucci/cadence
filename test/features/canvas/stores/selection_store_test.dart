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

    test('it removes object to selection', () {
      // Arrange
      final object = CanvasObjectStore();

      // Act
      selection.select(object);
      selection.unselect(object);

      // Assert
      expect(selection.list, isEmpty);
    });
  });
}
