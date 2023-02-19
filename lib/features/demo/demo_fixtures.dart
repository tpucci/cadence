import 'dart:math';

import 'package:app/features/issues/stores/issues_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class DemoFixtures {
  final _issuesStore = GetIt.I.get<IssuesStore>();
  static final rnd = Random();

  DemoFixtures() {
    for (var i = 0; i < 3; i++) {
      _issuesStore.create(
          offset: Offset(rnd.nextDouble() * 1000, rnd.nextDouble() * 1000));
    }
  }
}
