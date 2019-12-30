import 'dart:math';

import 'package:flutter/services.dart';

class Utils {
  static String camelizeKey(String key,
      [List<String> separators = const ["_", "-"]]) {
    var out = [];
    int i = 0;
    Set separatorsSet = separators.toSet();
    while (i < key.length) {
      if (separatorsSet.contains(key[i])) {
        out.add(key[i + 1].toUpperCase());
        i++;
      } else {
        out.add(key[i]);
      }
      i++;
    }
    return out.join("");
  }

  static Object camelize(Object obj) {
    if (obj == null) {
      return null;
    }
    if (obj is List) {
      if (obj.isEmpty) {
        return [];
      }
      return obj.map((item) => Utils.camelize(item)).toList();
    } else if (obj is Map) {
      Map<String, dynamic> out = {};
      for (var key in obj.keys) {
        var v = obj[key];
        out[Utils.camelizeKey(key.toString())] = Utils.camelize(v);
      }
      return out;
    } else {
      return obj;
    }
  }

  /// 复制到剪粘板
  /// String text 需要复制的文本
  static copyToClipboard(final String text) {
    if (text == null) return;
    Clipboard.setData(ClipboardData(text: text));
  }

  /// 返回当前时间戳
  static int currentTimeMillis() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  /// 返回两个日期相差的天数
  /// a - b
  static int daysBetween(DateTime a, DateTime b, [bool ignoreTime = false]) {
    if (ignoreTime) {
      int v = a.millisecondsSinceEpoch ~/ 86400000 -
          b.millisecondsSinceEpoch ~/ 86400000;
      if (v < 0) return -v;
      return v;
    } else {
      int v = a.millisecondsSinceEpoch - b.millisecondsSinceEpoch;
      if (v < 0) v = -v;
      return v ~/ 86400000;
    }
  }

  /// 随机生成 [a, b] 之间的整数
  static int randomInt(int min, int max) {
    final rand = Random();
    return rand.nextInt(max - min) + min;
  }
}
