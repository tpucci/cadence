import 'package:app/features/issues/stores/issue_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('IssueStore', () {
    test('it sets the initial offset', () {
      // Arrange
      const offset = Offset(10, 20);

      // Act
      final issue = IssueStore(offset: offset);

      // Assert
      expect(issue.offset, offset);
    });

    test('it moves the issue', () {
      // Arrange
      final issue = IssueStore(offset: Offset.zero);
      const expectedOffset = Offset(10, 12);

      // Act
      issue.move(expectedOffset);

      // Assert
      expect(issue.offset, expectedOffset);
    });
  });
}
