import 'package:app/features/canvas/stores/canvas_object_store.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'issue_store.g.dart';

abstract class Issue extends CanvasObject {
  abstract final String title;
  void rename(String title);
}

// ignore: library_private_types_in_public_api
class IssueStore = _IssueStore with _$IssueStore;

abstract class _IssueStore extends CanvasObjectStore
    with Store
    implements Issue {
  // FIXME: Dart thinks the following is not used. But it is.
  _IssueStore({offset = Offset.zero, this.title = ""}) : super(offset: offset);

  @override
  @observable
  String title;

  @override
  @action
  void rename(String title) {
    this.title = title;
  }
}
