import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'pointer_store.g.dart';

enum PointerPosition { up, down }

class PointerState {
  const PointerState({required this.offset, required this.position});
  final PointerPosition position;
  final Offset offset;
}

abstract class Pointer {
  abstract Offset offset;
  abstract Stream<PointerState> stateStream;
  void setOffset(Offset offset);
  void nextState(PointerState state);
}

// ignore: library_private_types_in_public_api
class PointerStore = _PointerStore with _$PointerStore;

abstract class _PointerStore with Store implements Pointer {
  _PointerStore() {
    stateStream =
        ObservableStream(_stateStreamController.stream).asBroadcastStream();
  }

  @override
  @observable
  Offset offset = Offset.zero;

  final _stateStreamController = StreamController<PointerState>();

  @override
  late Stream<PointerState> stateStream;

  @override
  @action
  void setOffset(Offset offset) {
    this.offset = offset;
  }

  @override
  void nextState(PointerState state) {
    _stateStreamController.add(state);
  }
}
