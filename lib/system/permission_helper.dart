import 'package:permission_handler/permission_handler.dart';

class _PremissionHelper {
  // 获取定位的权限
  Future<bool> getLocationPremission() async {
    try {
      Map<PermissionGroup, PermissionStatus> p =
          await _getPremission(PermissionGroup.location);
      if (p[PermissionGroup.location] == PermissionStatus.granted) {
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<Map<PermissionGroup, PermissionStatus>> _getPremission(
      PermissionGroup permissionGroup) async {
    return PermissionHandler().requestPermissions([permissionGroup]);
  }
}

_PremissionHelper premission = _PremissionHelper();
