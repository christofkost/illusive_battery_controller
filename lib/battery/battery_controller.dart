import 'package:flutter/foundation.dart';
import 'package:illusive_battery_controller/battery/battery_repository.dart';
import 'package:illusive_battery_controller/battery/battery_ui_state.dart';

class BatteryController with ChangeNotifier {
  final BatteryRepository _batteryRepository;

  BatteryUiState _batteryUiState = BatteryUiState();
  BatteryUiState get batteryUiState {
    return _batteryUiState;
  }

  BatteryController(this._batteryRepository);

  retreiveBatteryData() async {
    final batteryLevel = await _batteryRepository.getBatteryLevel();
    if (batteryLevel != null) {
      _batteryUiState =
          _batteryUiState.copyWith(batteryFeedback: '$batteryLevel%');

      notifyListeners();
    }
  }

  increaseBatteryLevel() {
    final numericBatteryLevel =
        int.parse(_batteryUiState.batteryFeedback.split('%')[0]);
  }
}
