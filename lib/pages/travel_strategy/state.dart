import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_travel/fishStore/fishGlobalStore/state.dart';

class PageState extends MutableSource
    implements FishGlobalBaseState, Cloneable<PageState> {
  List<int> list;

  @override
  Color themeColor;

  @override
  PageState clone() {
    return PageState()
      ..list = list
      ..themeColor = themeColor;
  }

  @override
  Object getItemData(int index) => list[index];

  @override
  String getItemType(int index) => 'toDo';

  @override
  int get itemCount => list?.length ?? 0;

  @override
  void setItemData(int index, Object data) => list[index] = data as int;
}

PageState initState(Map<String, dynamic> args) {
  //just demo, do nothing here...
  return PageState();
}

class ReportConnector extends ConnOp<PageState, FishGlobalState>
    with ReselectMixin<PageState, FishGlobalState> {
  @override
  FishGlobalState computed(PageState state) {
    return FishGlobalState();
  }

  @override
  List<dynamic> factors(PageState state) {
    return <int>[1, 2];
  }

  @override
  void set(PageState state, FishGlobalState subState) {
    throw Exception('Unexcepted to set PageState from ReportState');
  }
}
