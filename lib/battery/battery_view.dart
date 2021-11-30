import 'package:flutter/material.dart';

import 'battery_repository.dart';

const _positivePoleWidth = 15.0;
const _variableColor = Color(0xffF3AE72);

class BatteryView extends StatelessWidget {
  const BatteryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: _variableColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 50),
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
                      height: 150,
                      width: (MediaQuery.of(context).size.width) * 0.9 -
                          _positivePoleWidth,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: Colors.white, width: _positivePoleWidth)),
                    ),
                    Container(
                      height: 50,
                      width: _positivePoleWidth,
                      color: Colors.white,
                    )
                  ],
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
              padding: EdgeInsets.all(40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    backgroundColor: Colors.white,
                    foregroundColor: _variableColor,
                    mini: true,
                    elevation: 2,
                    onPressed: () {},
                    child: Icon(Icons.remove),
                  ),
                  OutlinedButton.icon(
                    icon: Icon(Icons.refresh),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        width: 3.0,
                        color: Colors.white,
                      ),
                      primary: Colors.white,
                    ),
                    label: Text('Reset'),
                    onPressed: () {
                      BatteryRepository.getBatteryLevel();
                    },
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.white,
                    foregroundColor: _variableColor,
                    mini: true,
                    elevation: 2,
                    onPressed: () {},
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
