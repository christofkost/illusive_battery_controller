import 'package:flutter/foundation.dart';
import 'package:illusive_battery_controller/battery/battery_repository.dart';
import 'package:illusive_battery_controller/battery/battery_ui_state.dart';

class BatteryController with ChangeNotifier {
  final BatteryRepository _batteryRepository;

  BatteryUiState batteryUiState = BatteryUiState();

  BatteryController(this._batteryRepository);

  getRealBatteryData() async {
    final batteryLevel = await _batteryRepository.getBatteryLevel();
    if (batteryLevel != null) {
      batteryUiState =
          batteryUiState.copyWith(batteryFeedback: '$batteryLevel%');

      notifyListeners();
    }
  }
}
