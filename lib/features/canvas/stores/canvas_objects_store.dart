import 'package:mobx/mobx.dart';

part 'canvas_objects_store.g.dart';

abstract class CanvasObjects {}

// ignore: library_private_types_in_public_api
class CanvasObjectsStore = _CanvasObjectsStore with _$CanvasObjectsStore;

abstract class _CanvasObjectsStore with Store implements CanvasObjects {}
