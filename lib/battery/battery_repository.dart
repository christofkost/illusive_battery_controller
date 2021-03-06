import 'dart:developer';

import 'package:flutter/services.dart';

class BatteryRepository {
  Future<int?> getBatteryLevel() async {
    try {
      final int result = await MethodChannel('samples.flutter.dev/battery')
          .invokeMethod('getBatteryLevel');

      return result;
    } on PlatformException catch (e) {
      log(e.toString());
      return null;
    }
  }
}
