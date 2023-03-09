// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CameraStore on _CameraStore, Store {
  late final _$offsetAtom = Atom(name: '_CameraStore.offset', context: context);

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

  late final _$scaleAtom = Atom(name: '_CameraStore.scale', context: context);

  @override
  double get scale {
    _$scaleAtom.reportRead();
    return super.scale;
  }

  @override
  set scale(double value) {
    _$scaleAtom.reportWrite(value, super.scale, () {
      super.scale = value;
    });
  }

  late final _$_CameraStoreActionController =
      ActionController(name: '_CameraStore', context: context);

  @override
  void pan(Offset scrollDelta) {
    final _$actionInfo =
        _$_CameraStoreActionController.startAction(name: '_CameraStore.pan');
    try {
      return super.pan(scrollDelta);
    } finally {
      _$_CameraStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void zoom(
      {required Offset fromOffset, double? factor, double scaleDelta = 0}) {
    final _$actionInfo =
        _$_CameraStoreActionController.startAction(name: '_CameraStore.zoom');
    try {
      return super
          .zoom(fromOffset: fromOffset, factor: factor, scaleDelta: scaleDelta);
    } finally {
      _$_CameraStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
offset: ${offset},
scale: ${scale}
    ''';
  }
}
