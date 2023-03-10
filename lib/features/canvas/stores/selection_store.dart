import 'package:app/features/canvas/stores/canvas_object_store.dart';
import 'package:mobx/mobx.dart';

part 'selection_store.g.dart';

abstract class Selection {
  abstract final List<CanvasObject> list;
  void select(CanvasObject canvasObject);
  void unselect(CanvasObject canvasObject);
}

// ignore: library_private_types_in_public_api
class SelectionStore = _SelectionStore with _$SelectionStore;

abstract class _SelectionStore with Store implements Selection {
  @override
  @observable
  List<CanvasObject> list = ObservableList<CanvasObject>();

  @override
  @action
  void select(CanvasObject canvasObject) {
    list.add(canvasObject);
  }

  @override
  @action
  void unselect(CanvasObject canvasObject) {
    list.remove(canvasObject);
  }
}
