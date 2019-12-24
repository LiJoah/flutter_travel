import 'package:flutter_travel/base/event_emitter.dart';
import 'package:mobx/mobx.dart';

part 'yiriyou.g.dart';

class YiRiYouStore = _YiRiYouStore with _$YiRiYouStore;

abstract class _YiRiYouStore with Store {
  EventEmitter eventEmitter = EventEmitter();
}
