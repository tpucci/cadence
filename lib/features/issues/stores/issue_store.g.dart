// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$IssueStore on _IssueStore, Store {
  late final _$offsetAtom = Atom(name: '_IssueStore.offset', context: context);

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

  late final _$titleAtom = Atom(name: '_IssueStore.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$_IssueStoreActionController =
      ActionController(name: '_IssueStore', context: context);

  @override
  void move(Offset offset) {
    final _$actionInfo =
        _$_IssueStoreActionController.startAction(name: '_IssueStore.move');
    try {
      return super.move(offset);
    } finally {
      _$_IssueStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void rename(String title) {
    final _$actionInfo =
        _$_IssueStoreActionController.startAction(name: '_IssueStore.rename');
    try {
      return super.rename(title);
    } finally {
      _$_IssueStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
offset: ${offset},
title: ${title}
    ''';
  }
}
