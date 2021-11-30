import 'package:flutter/material.dart';

class BatteryUiState {
  final Color backgroundColor;
  final String batteryFeedback;

  BatteryUiState(
      {this.backgroundColor = const Color(0xffF3AE72),
      this.batteryFeedback = "?"});

  BatteryUiState copyWith({
    Color? backgroundColor,
    String? batteryFeedback,
  }) {
    return BatteryUiState(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      batteryFeedback: batteryFeedback ?? this.batteryFeedback,
    );
  }
}
