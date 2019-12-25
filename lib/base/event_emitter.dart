import 'dart:collection';

/// 事件处理器
typedef void Handler<D>(D data);

class _EventListener {
  String _eventName;
  EventEmitter _emitter;
  bool _destroied = false;
  Handler handler;
  _EventListener(this._eventName, this.handler, this._emitter);

  unregister() {
    _emitter.off(_eventName, target: this);
    destroy();
  }

  bool destroy() {
    if (_destroied) {
      return false;
    }
    _emitter = null;
    _destroied = true;
    return true;
  }
}

/// NOTE: 事件发射驱动; 为component 提供事件驱动的能力, 避免参数的传递
class EventEmitter<E extends Map> {
  HashMap<String, List<_EventListener>> _events = HashMap();

  /// 事件监听
  _EventListener on(String event, Handler handler) {
    if (!_events.containsKey(event)) {
      _events[event] = [];
    }
    _EventListener listener = _EventListener(event, handler, this);
    _events[event].add(listener);
    return listener;
  }

  /// 发射事件
  bool emit<D extends Map>(String event, D data) {
    if (_events[event] == null || _events[event].isEmpty) {
      return false;
    }
    List<_EventListener> remains = [];
    for (_EventListener listener in _events[event]) {
      if (listener._destroied) {
        continue;
      }
      if (listener != null) {
        remains.add(listener);
      }
      listener.handler(data);
    }
    if (remains.length != _events[event].length) {
      _events[event] = remains;
    }
    return true;
  }

  /// 根据事件名和事件监听器注销事件
  off(String event, {_EventListener target}) {
    if (_events[event] == null || _events[event].isEmpty) {
      return false;
    }
    if (target != null) {
      for (var arr = _events[event], i = 0; i < arr.length; i++) {
        var listener = arr[i];
        if (listener != target) {
          continue;
        }
        _events[event] = _events[event].where((l) => l != listener).toList();
        if (_events[event].isEmpty) {
          _events.remove(event);
        }
      }
      print("Cannot find listenert of $event in $this --EventEmitter");
    } else {
      for (var arr = _events[event], i = 0; i < arr.length; i++) {
        _EventListener listener = arr[i];
        _events[event][i] = null;
        if (listener != null) {
          listener.destroy();
        }
      }
      _events.remove(event);
    }
    return true;
  }

  /// 移除所有的监听器
  removeAllListeners() {
    for (var name in _events.entries) {
      var events = _events[name];
      for (var arr = events, i = 0; i < arr.length; i++) {
        events.remove(i);
      }
      _events.remove(name);
    }
  }
}
