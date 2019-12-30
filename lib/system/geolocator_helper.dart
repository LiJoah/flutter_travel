import 'package:amap_core_fluttify/amap_core_fluttify.dart';
import 'package:amap_location_fluttify/amap_location_fluttify.dart';
import 'package:flutter_travel/base/event_emitter.dart';
import 'package:flutter_travel/system/permission_helper.dart';
import 'package:flutter_travel/configs/scret_config.dart';

class _GeolocatorHelper with EventEmitter {
  Location _lastLocation;

  /// init ios key
  initAmapCoreForIos() async {
    await AmapCore.init(mapKeyIos);
  }

  Future<Location> getLocation() async {
    try {
      if (await requestPermission()) {
        final location = await AmapLocation.fetchLocation();
        _lastLocation = location;
        return location;
      }
      return _lastLocation;
    } catch (e) {
      print(e);
      return _lastLocation;
    }
  }

  Future<bool> listenLocation() async {
    try {
      if (await requestPermission()) {
        await for (final location in AmapLocation.listenLocation()) {
          emit("onLocation", {location: location});
        }
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> stopLocation() async {
    try {
      if (await requestPermission()) {
        await AmapLocation.stopLocation();
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Location getLastLocation() {
    return _lastLocation;
  }

  Future<bool> requestPermission() async {
    return premission.getLocationPremission();
  }
}

_GeolocatorHelper geo = _GeolocatorHelper();
