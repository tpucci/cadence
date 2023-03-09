import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'canvas_object_store.g.dart';

abstract class CanvasObject {
  abstract final Offset offset;
  void move(Offset offset);
  abstract final bool selected;
  void select();
  void unselect();
  void toggleSelection();
}

// ignore: library_private_types_in_public_api
class CanvasObjectStore = _CanvasObjectStore with _$CanvasObjectStore;

abstract class _CanvasObjectStore with Store implements CanvasObject {
  // FIXME: Dart thinks the following is not used. But it is.
  _CanvasObjectStore({this.offset = Offset.zero});

  @override
  @observable
  Offset offset;

  @override
  @action
  void move(Offset offset) {
    this.offset = offset;
  }

  @observable
  @override
  bool selected = false;

  @action
  @override
  void select() {
    selected = true;
  }

  @action
  @override
  void unselect() {
    selected = false;
  }

  @action
  @override
  void toggleSelection() {
    selected = !selected;
  }
}
