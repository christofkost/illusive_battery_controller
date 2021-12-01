import 'package:flutter/foundation.dart';
import 'package:illusive_battery_controller/battery/battery_repository.dart';

class BatteryChangeNotifier with ChangeNotifier {
  final BatteryRepository _batteryRepository;

  BatteryChangeNotifier(this._batteryRepository);

  // the following two lines can be seen as a model
  int _batteryLevel = -1;
  final int _backgroundColorHexValue = 0xFFF3AE72; // yellow color

  // the remaining code of this file can be seen as controller
  int get backgroundColorHexValue {
    return _backgroundColorHexValue;
  }

  int get batteryLevel {
    return _batteryLevel;
  }

  setOriginalBatteryData() async {
    final batteryLevelFromRepository =
        await _batteryRepository.getBatteryLevel();
    if (batteryLevelFromRepository != null) {
      _batteryLevel = batteryLevelFromRepository;

      notifyListeners();
    }
  }
}
