import 'package:fish_redux/fish_redux.dart';

/// NOTE: 这里枚举页面上会使用的 action
enum PageAction { initToDos, onAdd }

class PageActionCreator {
  static Action initToDosAction(List<int> toDos) {
    return Action(PageAction.initToDos, payload: toDos);
  }

  static Action onAddAction() {
    return const Action(PageAction.onAdd);
  }
}
