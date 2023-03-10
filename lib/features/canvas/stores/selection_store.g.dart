// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selection_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SelectionStore on _SelectionStore, Store {
  late final _$listAtom = Atom(name: '_SelectionStore.list', context: context);

  @override
  List<CanvasObject> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(List<CanvasObject> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  late final _$_SelectionStoreActionController =
      ActionController(name: '_SelectionStore', context: context);

  @override
  void select(CanvasObject canvasObject) {
    final _$actionInfo = _$_SelectionStoreActionController.startAction(
        name: '_SelectionStore.select');
    try {
      return super.select(canvasObject);
    } finally {
      _$_SelectionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void unselect(CanvasObject canvasObject) {
    final _$actionInfo = _$_SelectionStoreActionController.startAction(
        name: '_SelectionStore.unselect');
    try {
      return super.unselect(canvasObject);
    } finally {
      _$_SelectionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
