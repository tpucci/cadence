import 'dart:async';

import 'package:app/features/camera/stores/camera_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'pointer_store.g.dart';

enum PointerPosition { up, down }

class PointerState {
  const PointerState({required this.offset, required this.position});
  final PointerPosition position;
  final Offset offset;
}

abstract class Pointer {
  abstract final Offset offset;
  abstract final Stream<PointerState> stateStream;
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

  final _camera = GetIt.I.get<Camera>();

  @observable
  Offset _offset = Offset.zero;

  final _stateStreamController = StreamController<PointerState>();

  @override
  late Stream<PointerState> stateStream;

  @override
  @computed
  Offset get offset => (_offset - _camera.offset) / _camera.scale;

  @override
  @action
  void setOffset(Offset offset) {
    _offset = offset;
  }

  @override
  void nextState(PointerState state) {
    _stateStreamController.add(state);
  }
}
