import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illusive_battery_controller/battery/battery_change_notifier.dart';
import 'package:illusive_battery_controller/battery/battery_repository.dart';
import 'package:illusive_battery_controller/battery/battery_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ChangeNotifierProvider(
      create: (context) {
        final batteryController = BatteryChangeNotifier(BatteryRepository());
        batteryController.setOriginalBatteryData();
        return batteryController;
      },
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: GoogleFonts.montserratTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          home: BatteryView()),
    );
  }
}
