import 'package:fish_redux/fish_redux.dart';

import 'action.dart';

import 'state.dart';

Effect<PageState> buildEffect() {
  return combineEffects(<Object, Effect<PageState>>{
    // NOTE: Liftcycle 是 flutter widget 的生命周期
    Lifecycle.initState: _init,
    PageAction.onAdd: _onAdd,
  });
}

void _init(Action action, Context<PageState> ctx) {
  final List<int> initToDos = <int>[1, 2, 3];

  ctx.dispatch(PageActionCreator.initToDosAction(initToDos));
}

void _onAdd(Action action, Context<PageState> ctx) {
  // TODO:
  print("add");
  // Navigator.of(ctx.context)
  //     .pushNamed('', arguments: null)
  //     .then((dynamic toDo) {
  //       print(toDo);
  // });
}
