import 'package:flutter/material.dart';
import 'package:illusive_battery_controller/battery/battery_change_notifier.dart';
import 'package:provider/provider.dart';

const _batteryBorderWidth = 15.0;

class BatteryView extends StatelessWidget {
  const BatteryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        Color(context.watch<BatteryChangeNotifier>().backgroundColorHexValue);
    return Scaffold(
        body: AnimatedContainer(
      color: backgroundColor,
      duration: Duration(seconds: 1),
      curve: Curves.decelerate,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 50, top: 50),
            child: Text(
              'Illusive Battery Controller',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 130,
                    width: (MediaQuery.of(context).size.width) * 0.9 -
                        _batteryBorderWidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: Colors.white, width: _batteryBorderWidth)),
                  ),
                  Container(
                    height: 50,
                    width: _batteryBorderWidth,
                    color: Colors.white,
                  )
                ],
              ),
              Positioned.fill(
                child: Center(
                    child: Text(
                  "${context.watch<BatteryChangeNotifier>().batteryLevel}%",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.bold),
                )),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  foregroundColor: backgroundColor,
                  elevation: 2,
                  onPressed: () {
                    context
                        .read<BatteryChangeNotifier>()
                        .changeBatteryLevel(-10);
                  },
                  child: Icon(Icons.remove),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      width: 3.0,
                      color: Colors.white,
                    ),
                    primary: Colors.white,
                  ),
                  child: Text('Back to reality'),
                  onPressed: () {
                    context
                        .read<BatteryChangeNotifier>()
                        .setOriginalBatteryData();
                  },
                ),
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  foregroundColor: backgroundColor,
                  elevation: 2,
                  onPressed: () {
                    context
                        .read<BatteryChangeNotifier>()
                        .changeBatteryLevel(10);
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
