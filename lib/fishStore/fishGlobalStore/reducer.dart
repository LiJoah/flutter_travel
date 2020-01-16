import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';
import 'state.dart';

Reducer<FishGlobalState> buildReducer() {
  return asReducer(
    <Object, Reducer<FishGlobalState>>{
      GlobalAction.changeThemeColor: _onchangeThemeColor,
    },
  );
}

List<Color> _colors = <Color>[
  Colors.green,
  Colors.red,
  Colors.black,
  Colors.blue
];

FishGlobalState _onchangeThemeColor(FishGlobalState state, Action action) {
  final Color next =
      _colors[((_colors.indexOf(state.themeColor) + 1) % _colors.length)];
  return state.clone()..themeColor = next;
}
