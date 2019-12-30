import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_travel/base/utils.dart';

void main() {
  utilsTest();
}

/// 工具函数的单元测试
void utilsTest() {
  group('Utils工具类测试', () {
    test('将下划线和中划线的字符串 key, 变为驼峰', () {
      String testKey = "a_b_c";
      String expectRes = "aBC";
      String r = Utils.camelizeKey(testKey);
      expect(r, equals(expectRes));
    });

    test('随机生成 [min, max] 之间的整数', () {
      int r = Utils.randomInt(1, 10);
      expect(r >= 1 && r <= 10, isTrue);
    });
  });
}
