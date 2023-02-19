import 'package:app/di.dart';
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
      Offset offset = const Offset(2, 3);

      // Act
      issuesStore.create(offset: offset);

      // Assert
      expect(issuesStore.issues.length, 1);
    });
  });
}
