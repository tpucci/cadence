import 'package:app/features/canvas/stores/selection_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
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

  final _selection = GetIt.I.get<Selection>();

  @override
  @observable
  Offset offset;

  @override
  @action
  void move(Offset offset) {
    this.offset = offset;
  }

  @computed
  @override
  bool get selected => _selection.list.contains(this);

  @action
  @override
  void select() {
    _selection.select(this);
  }

  @action
  @override
  void unselect() {
    _selection.unselect(this);
  }

  @action
  @override
  void toggleSelection() {
    selected ? unselect() : select();
  }
}
