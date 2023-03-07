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
      final issue = IssueStore();
      const expectedOffset = Offset(10, 12);

      // Act
      issue.move(expectedOffset);

      // Assert
      expect(issue.offset, expectedOffset);
    });

    test('it renames the issue', () {
      // Arrange
      final issue = IssueStore();
      const title = "A new title";

      // Act
      issue.rename(title);

      // Assert
      expect(issue.title, title);
    });
  });
}
