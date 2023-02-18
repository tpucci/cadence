import 'package:app/di.dart';
import 'package:app/features/issues/stores/issue_store.dart';
import 'package:app/features/issues/stores/issues_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  group('IssuesStore', () {
    late IssuesStore issuesStore;

    setUp(() {
      setupDi(clear: true);
      issuesStore = GetIt.I.get<IssuesStore>();
    });

    test('it stores some issues', () {
      // Arrange
      Issue issue = IssueStore(offset: const Offset(2, 3));

      // Act
      issuesStore.add(issue);

      // Assert
      expect(issuesStore.issues, contains(issue));
    });
  });
}
