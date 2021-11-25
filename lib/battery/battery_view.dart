import 'package:flutter/material.dart';

class BatteryView extends StatelessWidget {
  const BatteryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Icon(
          Icons.battery_full,
          size: 300,
        )
      ],
    ));
  }
}
