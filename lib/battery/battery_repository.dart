import 'dart:developer';

import 'package:flutter/services.dart';

class BatteryRepository {
  BatteryRepository._privateConstructor();

  static final BatteryRepository instance =
      BatteryRepository._privateConstructor();

  Future<void> getBatteryLevel() async {
    try {
      final int result = await MethodChannel('samples.flutter.dev/battery')
          .invokeMethod('getBatteryLevel');

      log(result.toString());
    } on PlatformException catch (e) {
      log(e.toString());
    }
  }
}
