import 'package:app/features/issues/issue_card.dart';
import 'package:app/features/issues/stores/issues_store.dart';
import 'package:app/features/gesture_handler/hit_test_permissive_stack.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class IssueCardsRenderer extends StatelessWidget {
  IssueCardsRenderer({super.key});

  final _issuesStore = GetIt.I.get<IssuesStore>();

  @override
  Widget build(BuildContext context) {
    return HitTestPermissiveStack(
        clipBehavior: Clip.none,
        children: _issuesStore.issues
            .map((issue) => IssueCard(issue: issue))
            .toList());
  }
}
