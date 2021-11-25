import 'package:flutter/material.dart';
import 'package:illusive_battery_controller/battery/battery_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Illusive Battery Controller', home: BatteryView());
  }
}
