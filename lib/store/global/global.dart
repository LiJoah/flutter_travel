import 'package:mobx/mobx.dart';

part 'global.g.dart';

class GlobalStore = _GlobalStore with _$GlobalStore;

abstract class _GlobalStore with Store {
  @observable
  String name = "liyao";

  @observable
  bool isLogin = false;

  @action
  void setLogin(bool v) {
    isLogin = v;
  }

  @action
  void changeName() {
    name = name == "xhm" ? "liyao" : "xhm";
  }
}
