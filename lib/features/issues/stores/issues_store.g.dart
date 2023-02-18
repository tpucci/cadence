// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issues_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MobxIssuesStore on _MobxIssuesStore, Store {
  late final _$issuesAtom =
      Atom(name: '_MobxIssuesStore.issues', context: context);

  @override
  List<Issue> get issues {
    _$issuesAtom.reportRead();
    return super.issues;
  }

  @override
  set issues(List<Issue> value) {
    _$issuesAtom.reportWrite(value, super.issues, () {
      super.issues = value;
    });
  }

  late final _$_MobxIssuesStoreActionController =
      ActionController(name: '_MobxIssuesStore', context: context);

  @override
  void add(Issue issue) {
    final _$actionInfo = _$_MobxIssuesStoreActionController.startAction(
        name: '_MobxIssuesStore.add');
    try {
      return super.add(issue);
    } finally {
      _$_MobxIssuesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
issues: ${issues}
    ''';
  }
}
