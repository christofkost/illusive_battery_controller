import 'package:flutter_test/flutter_test.dart';
import 'package:illusive_battery_controller/battery/battery_change_notifier.dart';
import 'package:illusive_battery_controller/battery/battery_repository.dart';

void main() {
  test('Battery value should be incremented', () async {
    final batteryChangeNotifier =
        BatteryChangeNotifier(MockBatteryRepository());

    await batteryChangeNotifier.setOriginalBatteryData();

    expect(batteryChangeNotifier.batteryLevel, 65);
    expect(batteryChangeNotifier.backgroundColorHexValue, 0xFFF3AE72); // yellow

    batteryChangeNotifier.changeBatteryLevel(10);

    expect(batteryChangeNotifier.batteryLevel, 75);
    expect(batteryChangeNotifier.backgroundColorHexValue, 0xFF629C80); // green
  });

  test('Battery value should be decremented', () async {
    final batteryChangeNotifier =
        BatteryChangeNotifier(MockBatteryRepository());

    await batteryChangeNotifier.setOriginalBatteryData();

    expect(batteryChangeNotifier.batteryLevel, 65);
    expect(batteryChangeNotifier.backgroundColorHexValue, 0xFFF3AE72); // yellow

    batteryChangeNotifier.changeBatteryLevel(-10);

    expect(batteryChangeNotifier.batteryLevel, 55);
    expect(batteryChangeNotifier.backgroundColorHexValue, 0xFFF3AE72); // yellow
  });
}

class MockBatteryRepository extends BatteryRepository {
  @override
  getBatteryLevel() async {
    return 65;
  }
}
