import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenUtilHelper {
  static double setHeight(double h) {
    return ScreenUtil().setHeight(h).toDouble();
  }

  static double setWidth(double w) {
    return ScreenUtil().setWidth(w).toDouble();
  }

  static double setScreenWidth() {
    return ScreenUtil().setWidth(ScreenUtil.screenWidth).toDouble();
  }
}
