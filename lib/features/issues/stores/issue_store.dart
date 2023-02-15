import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'issue_store.g.dart';

abstract class Issue {
  abstract final Offset offset;
  void move(Offset offset);
}

// ignore: library_private_types_in_public_api
class IssueStore = _IssueStore with _$IssueStore;

abstract class _IssueStore with Store implements Issue {
  _IssueStore({required this.offset});

  @override
  @observable
  Offset offset;

  @override
  @action
  void move(Offset offset) {
    this.offset = offset;
  }
}
