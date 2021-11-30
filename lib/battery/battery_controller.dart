import 'package:flutter/foundation.dart';
import 'package:illusive_battery_controller/battery/battery_repository.dart';

class BatteryController with ChangeNotifier {
  final BatteryRepository _batteryRepository;

  BatteryController(this._batteryRepository);

  getRealBatteryData() async {
    await _batteryRepository.getBatteryLevel();
  }
}
