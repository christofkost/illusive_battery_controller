import 'dart:developer';

import 'package:flutter/services.dart';

class BatteryRepository {
  static Future<int?> getBatteryLevel() async {
    try {
      final int result = await MethodChannel('samples.flutter.dev/battery')
          .invokeMethod('getBatteryLevel');
      log(result.toString());
      return result;
    } on PlatformException catch (e) {
      log(e.toString());
      return null;
    }
  }
}
