import 'package:app/features/issues/stores/issue_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('IssueStore', () {
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
