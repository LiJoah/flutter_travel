import 'package:shared_preferences/shared_preferences.dart';

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
    if (value is double) {
      _sharedPreferences.setDouble(key, value);
    } else if (value is int) {
      _sharedPreferences.setInt(key, value);
    } else if (value is List<String>) {
      _sharedPreferences.setStringList(key, value);
    } else if (value is bool) {
      _sharedPreferences.setBool(key, value);
    } else {
      _sharedPreferences.setString(key, value.toString());
    }
  }

  setItems(Map<String, dynamic> map) {
    map.forEach((key, value) {
      setItem(key, value);
    });
  }

  dynamic getItem(String key) {
    bool hasKey = _sharedPreferences.containsKey(key);
    if (hasKey) {
      return _sharedPreferences.get(key);
    }
    return null;
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