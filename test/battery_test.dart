// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:illusive_battery_controller/battery/battery_change_notifier.dart';
import 'package:illusive_battery_controller/battery/battery_repository.dart';

import 'package:illusive_battery_controller/main.dart';

void main() {
  test('Battery value should be incremented', () async {
    final batteryChangeNotifier =
        BatteryChangeNotifier(MockBatteryRepository());

    await batteryChangeNotifier.setOriginalBatteryData();

    expect(batteryChangeNotifier.batteryLevel, 65);
    expect(batteryChangeNotifier.backgroundColorHexValue, 0xFFF3AE72);

    batteryChangeNotifier.changeBatteryLevel(10);

    expect(batteryChangeNotifier.batteryLevel, 75);
    expect(batteryChangeNotifier.backgroundColorHexValue, 0xFF629C80);
  });

  test('Battery value should be decremented', () async {
    final batteryChangeNotifier =
        BatteryChangeNotifier(MockBatteryRepository());

    await batteryChangeNotifier.setOriginalBatteryData();

    expect(batteryChangeNotifier.batteryLevel, 65);
    expect(batteryChangeNotifier.backgroundColorHexValue, 0xFFF3AE72);

    batteryChangeNotifier.changeBatteryLevel(-10);

    expect(batteryChangeNotifier.batteryLevel, 55);
    expect(batteryChangeNotifier.backgroundColorHexValue, 0xFFF3AE72);
  });
}

class MockBatteryRepository extends BatteryRepository {
  @override
  getBatteryLevel() async {
    return 65;
  }
}
