import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illusive_battery_controller/battery/battery_controller.dart';
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
    return ChangeNotifierProvider(
      create: (context) => BatteryController(BatteryRepository()),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Illusive Battery Controller',
          theme: ThemeData(
            textTheme: GoogleFonts.montserratTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          home: BatteryView()),
    );
  }
}
