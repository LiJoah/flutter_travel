
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_travel/fishStore/fishGlobalStore/reducer.dart';
import 'package:flutter_travel/fishStore/fishGlobalStore/state.dart';

/// 建立一个AppStore
/// 目前它的功能只有切换主题
class FishGlobalStore {
  static Store<FishGlobalState> _globalStore;

  static Store<FishGlobalState> get store =>
      _globalStore ??= createStore<FishGlobalState>(FishGlobalState(), buildReducer());
}
