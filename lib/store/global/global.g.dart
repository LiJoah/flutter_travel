// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GlobalStore on _GlobalStore, Store {
  final _$nameAtom = Atom(name: '_GlobalStore.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$isLoginAtom = Atom(name: '_GlobalStore.isLogin');

  @override
  bool get isLogin {
    _$isLoginAtom.context.enforceReadPolicy(_$isLoginAtom);
    _$isLoginAtom.reportObserved();
    return super.isLogin;
  }

  @override
  set isLogin(bool value) {
    _$isLoginAtom.context.conditionallyRunInAction(() {
      super.isLogin = value;
      _$isLoginAtom.reportChanged();
    }, _$isLoginAtom, name: '${_$isLoginAtom.name}_set');
  }

  final _$_GlobalStoreActionController = ActionController(name: '_GlobalStore');

  @override
  void setLogin(bool v) {
    final _$actionInfo = _$_GlobalStoreActionController.startAction();
    try {
      return super.setLogin(v);
    } finally {
      _$_GlobalStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeName() {
    final _$actionInfo = _$_GlobalStoreActionController.startAction();
    try {
      return super.changeName();
    } finally {
      _$_GlobalStoreActionController.endAction(_$actionInfo);
    }
  }
}
