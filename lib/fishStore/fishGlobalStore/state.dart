import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';

abstract class FishGlobalBaseState {
  Color get themeColor;
  set themeColor(Color color);
}

class FishGlobalState implements FishGlobalBaseState, Cloneable<FishGlobalState> {
  @override
  Color themeColor;

  @override
  FishGlobalState clone() {
    return FishGlobalState();
  }
}
