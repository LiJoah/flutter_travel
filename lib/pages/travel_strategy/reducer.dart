import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PageState> buildReducer() {
  return asReducer(
    <Object, Reducer<PageState>>{PageAction.initToDos: _initToDosReducer},
  );
}

PageState _initToDosReducer(PageState state, Action action) {
  final List<int> list = action.payload as List<int> ?? <int>[];
  final PageState newState = state.clone();
  newState.list = list;
  return newState;
}
