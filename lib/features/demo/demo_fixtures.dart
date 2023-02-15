import 'package:app/features/issues/stores/issues_store.dart';
import 'package:get_it/get_it.dart';

class DemoFixtures {
  final _issuesStore = GetIt.I.get<IssuesStore>();
}
