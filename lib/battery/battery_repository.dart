import 'package:flutter/services.dart';

class BatteryRepository {
  static const platform = MethodChannel('samples.flutter.dev/battery');

  static Future<void> getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = '$result % ';
    } on PlatformException catch (_) {
      batteryLevel = "Failed to get battery level.";
    }
  }
}
