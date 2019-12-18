// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$IndexStore on _IndexStore, Store {
  final _$homeInfoAtom = Atom(name: '_IndexStore.homeInfo');

  @override
  HomeInfoModel get homeInfo {
    _$homeInfoAtom.context.enforceReadPolicy(_$homeInfoAtom);
    _$homeInfoAtom.reportObserved();
    return super.homeInfo;
  }

  @override
  set homeInfo(HomeInfoModel value) {
    _$homeInfoAtom.context.conditionallyRunInAction(() {
      super.homeInfo = value;
      _$homeInfoAtom.reportChanged();
    }, _$homeInfoAtom, name: '${_$homeInfoAtom.name}_set');
  }

  final _$showFloatAdAtom = Atom(name: '_IndexStore.showFloatAd');

  @override
  bool get showFloatAd {
    _$showFloatAdAtom.context.enforceReadPolicy(_$showFloatAdAtom);
    _$showFloatAdAtom.reportObserved();
    return super.showFloatAd;
  }

  @override
  set showFloatAd(bool value) {
    _$showFloatAdAtom.context.conditionallyRunInAction(() {
      super.showFloatAd = value;
      _$showFloatAdAtom.reportChanged();
    }, _$showFloatAdAtom, name: '${_$showFloatAdAtom.name}_set');
  }

  final _$valueAtom = Atom(name: '_IndexStore.value');

  @override
  int get value {
    _$valueAtom.context.enforceReadPolicy(_$valueAtom);
    _$valueAtom.reportObserved();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.context.conditionallyRunInAction(() {
      super.value = value;
      _$valueAtom.reportChanged();
    }, _$valueAtom, name: '${_$valueAtom.name}_set');
  }

  final _$currentTabIndexAtom = Atom(name: '_IndexStore.currentTabIndex');

  @override
  int get currentTabIndex {
    _$currentTabIndexAtom.context.enforceReadPolicy(_$currentTabIndexAtom);
    _$currentTabIndexAtom.reportObserved();
    return super.currentTabIndex;
  }

  @override
  set currentTabIndex(int value) {
    _$currentTabIndexAtom.context.conditionallyRunInAction(() {
      super.currentTabIndex = value;
      _$currentTabIndexAtom.reportChanged();
    }, _$currentTabIndexAtom, name: '${_$currentTabIndexAtom.name}_set');
  }

  final _$indexAppBarTitleAtom = Atom(name: '_IndexStore.indexAppBarTitle');

  @override
  String get indexAppBarTitle {
    _$indexAppBarTitleAtom.context.enforceReadPolicy(_$indexAppBarTitleAtom);
    _$indexAppBarTitleAtom.reportObserved();
    return super.indexAppBarTitle;
  }

  @override
  set indexAppBarTitle(String value) {
    _$indexAppBarTitleAtom.context.conditionallyRunInAction(() {
      super.indexAppBarTitle = value;
      _$indexAppBarTitleAtom.reportChanged();
    }, _$indexAppBarTitleAtom, name: '${_$indexAppBarTitleAtom.name}_set');
  }

  final _$reloadHomeInfoAsyncAction = AsyncAction('reloadHomeInfo');

  @override
  Future reloadHomeInfo() {
    return _$reloadHomeInfoAsyncAction.run(() => super.reloadHomeInfo());
  }

  final _$_IndexStoreActionController = ActionController(name: '_IndexStore');

  @override
  void increment() {
    final _$actionInfo = _$_IndexStoreActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_IndexStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentTabIndex(int index) {
    final _$actionInfo = _$_IndexStoreActionController.startAction();
    try {
      return super.setCurrentTabIndex(index);
    } finally {
      _$_IndexStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic initHomeInfo(HomeInfoModel info) {
    final _$actionInfo = _$_IndexStoreActionController.startAction();
    try {
      return super.initHomeInfo(info);
    } finally {
      _$_IndexStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setShowFloatAd(bool value) {
    final _$actionInfo = _$_IndexStoreActionController.startAction();
    try {
      return super.setShowFloatAd(value);
    } finally {
      _$_IndexStoreActionController.endAction(_$actionInfo);
    }
  }
}
