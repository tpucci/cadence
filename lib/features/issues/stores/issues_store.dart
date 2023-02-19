import 'package:app/features/issues/stores/issue_store.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'issues_store.g.dart';

abstract class IssuesStore {
  abstract List<Issue> issues;
  void create({required Offset offset});
}

// ignore: library_private_types_in_public_api
class MobxIssuesStore = _MobxIssuesStore with _$MobxIssuesStore;

abstract class _MobxIssuesStore with Store implements IssuesStore {
  @override
  @observable
  var issues = [];

  @override
  @action
  void create({required Offset offset}) {
    Issue issue = IssueStore(offset: offset);
    issues.add(issue);
  }
}
