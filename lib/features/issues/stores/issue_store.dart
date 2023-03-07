import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'issue_store.g.dart';

abstract class Issue {
  abstract final Offset offset;
  abstract final String title;
  void move(Offset offset);
  void rename(String title);
}

// ignore: library_private_types_in_public_api
class IssueStore = _IssueStore with _$IssueStore;

abstract class _IssueStore with Store implements Issue {
  _IssueStore({this.offset = Offset.zero, this.title = ""});

  @override
  @observable
  Offset offset;

  @override
  @observable
  String title;

  @override
  @action
  void move(Offset offset) {
    this.offset = offset;
  }

  @override
  @action
  void rename(String title) {
    this.title = title;
  }
}
