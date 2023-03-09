import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'camera_store.g.dart';

abstract class Camera {
  abstract Offset offset;
  abstract double scale;
  void pan(Offset scrollDelta);
  void zoom({required Offset fromOffset, double factor, double scaleDelta});
}

// ignore: library_private_types_in_public_api
class CameraStore = _CameraStore with _$CameraStore;

abstract class _CameraStore with Store implements Camera {
  final _zoomSpeed = 0.01;
  final _minScale = 0.3;
  final _maxScale = 4;

  @observable
  @override
  Offset offset = Offset.zero;

  @observable
  @override
  double scale = 1;

  @action
  @override
  void pan(Offset scrollDelta) {
    offset -= scrollDelta;
  }

  @action
  @override
  void zoom(
      {required Offset fromOffset, double? factor, double scaleDelta = 0}) {
    final newScale =
        ((factor != null) ? factor : (scale - scaleDelta * _zoomSpeed))
            .clamp(_minScale, _maxScale)
            .toDouble();
    offset = (offset - fromOffset) * newScale / scale + fromOffset;
    scale = newScale;
  }
}
