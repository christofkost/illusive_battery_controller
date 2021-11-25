import 'dart:math' as math;

import 'package:flutter/material.dart';

class BatteryView extends StatelessWidget {
  const BatteryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Illusive Battery Controller',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
          ),
          Stack(
            children: [
              Transform.rotate(
                angle: math.pi / 2,
                child: Icon(
                  Icons.battery_full,
                  size: 300,
                ),
              ),
              Positioned.fill(
                child: Center(
                    child: Text(
                  "64%",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.bold),
                )),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  onPressed: () {},
                  child: Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {},
                  child: Icon(Icons.remove),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
