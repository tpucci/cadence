// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'canvas_object_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CanvasObjectStore on _CanvasObjectStore, Store {
  Computed<bool>? _$selectedComputed;

  @override
  bool get selected =>
      (_$selectedComputed ??= Computed<bool>(() => super.selected,
              name: '_CanvasObjectStore.selected'))
          .value;

  late final _$offsetAtom =
      Atom(name: '_CanvasObjectStore.offset', context: context);

  @override
  Offset get offset {
    _$offsetAtom.reportRead();
    return super.offset;
  }

  @override
  set offset(Offset value) {
    _$offsetAtom.reportWrite(value, super.offset, () {
      super.offset = value;
    });
  }

  late final _$_CanvasObjectStoreActionController =
      ActionController(name: '_CanvasObjectStore', context: context);

  @override
  void move(Offset offset) {
    final _$actionInfo = _$_CanvasObjectStoreActionController.startAction(
        name: '_CanvasObjectStore.move');
    try {
      return super.move(offset);
    } finally {
      _$_CanvasObjectStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void select() {
    final _$actionInfo = _$_CanvasObjectStoreActionController.startAction(
        name: '_CanvasObjectStore.select');
    try {
      return super.select();
    } finally {
      _$_CanvasObjectStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void unselect() {
    final _$actionInfo = _$_CanvasObjectStoreActionController.startAction(
        name: '_CanvasObjectStore.unselect');
    try {
      return super.unselect();
    } finally {
      _$_CanvasObjectStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleSelection() {
    final _$actionInfo = _$_CanvasObjectStoreActionController.startAction(
        name: '_CanvasObjectStore.toggleSelection');
    try {
      return super.toggleSelection();
    } finally {
      _$_CanvasObjectStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
offset: ${offset},
selected: ${selected}
    ''';
  }
}
