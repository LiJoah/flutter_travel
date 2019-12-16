import 'package:mobx/mobx.dart';

part 'global.g.dart';

class GlobalStore = _GlobalStore with _$GlobalStore;

abstract class _GlobalStore with Store {
  @observable
  String name = "liyao";

  @action
  void changeName() {
    name = name == "xhm" ? "liyao" : "xhm";
  }
}
