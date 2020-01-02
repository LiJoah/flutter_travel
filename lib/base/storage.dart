import 'dart:convert';

import 'package:flutter_travel/base/logger_format.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// NOTE: 定义本地缓存的字段
class StorageKeyAlias {
  static final String homeInfo = "homeInfo";
  static String getYiriyouDetailKey(String spuId) {
    return "yiriyouDetail_$spuId";
  }
}

class _Storage {
  SharedPreferences _sharedPreferences;
  _Storage() {
    loaded = _loadPreferences();
  }

  Future<void> loaded;

  Future<void> _loadPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  setItem(String key, dynamic value) {
    logger.debug("set key:[$key], value: $value for Storage");
    if (value is double) {
      _sharedPreferences.setDouble(key, value);
    } else if (value is int) {
      _sharedPreferences.setInt(key, value);
    } else if (value is List<String>) {
      _sharedPreferences.setStringList(key, value);
    } else if (value is bool) {
      _sharedPreferences.setBool(key, value);
    } else {
      _sharedPreferences.setString(key, jsonEncode(value));
    }
  }

  setItems(Map<String, dynamic> map) {
    map.forEach((key, value) {
      setItem(key, value);
    });
  }

  dynamic getItem(String key) {
    bool hasKey = _sharedPreferences.containsKey(key);
    var r;
    if (hasKey) {
      r = _sharedPreferences.get(key);
      if (r == null || r.toString().isEmpty) {
        r = null;
      }
    }
    logger.debug("get key:[$key] value: $r, from Storage");
    return r;
  }

  Future<bool> delete(String key) async {
    bool res = await _sharedPreferences.setString(key, "");
    return res;
  }

  Future<bool> deleteKeys(List<String> keys) async {
    int count = 0;
    for (var key in keys) {
      if (await _sharedPreferences.containsKey(key)) {
        bool r = await _sharedPreferences.setString(key, "");
        if (r) {
          count++;
        }
      }
    }
    if (count == keys.length) {
      return true;
    }
    return false;
  }

  List<dynamic> getItems(List<String> keys) {
    var list = [];
    for (String key in keys) {
      bool hasKey = _sharedPreferences.containsKey(key);
      if (!hasKey) {
        continue;
      }
      var value = getItem(key);
      list.add(value);
    }
    return list;
  }
}

_Storage storage = _Storage();
