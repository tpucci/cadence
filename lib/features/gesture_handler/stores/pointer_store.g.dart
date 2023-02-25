// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pointer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PointerStore on _PointerStore, Store {
  Computed<Offset>? _$offsetComputed;

  @override
  Offset get offset => (_$offsetComputed ??=
          Computed<Offset>(() => super.offset, name: '_PointerStore.offset'))
      .value;

  late final _$_offsetAtom =
      Atom(name: '_PointerStore._offset', context: context);

  @override
  Offset get _offset {
    _$_offsetAtom.reportRead();
    return super._offset;
  }

  @override
  set _offset(Offset value) {
    _$_offsetAtom.reportWrite(value, super._offset, () {
      super._offset = value;
    });
  }

  late final _$_PointerStoreActionController =
      ActionController(name: '_PointerStore', context: context);

  @override
  void setOffset(Offset offset) {
    final _$actionInfo = _$_PointerStoreActionController.startAction(
        name: '_PointerStore.setOffset');
    try {
      return super.setOffset(offset);
    } finally {
      _$_PointerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
offset: ${offset}
    ''';
  }
}
