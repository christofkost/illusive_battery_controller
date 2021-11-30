import 'dart:developer';

import 'package:flutter/services.dart';

class BatteryRepository {
  static Future<void> getBatteryLevel() async {
    try {
      final int result = await MethodChannel('samples.flutter.dev/battery')
          .invokeMethod('getBatteryLevel');
      String batteryLevel = '$result%';
      log(batteryLevel);
    } on PlatformException catch (e) {
      log(e.toString());
    }
  }
}
