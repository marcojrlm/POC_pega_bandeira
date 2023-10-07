import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:poc_pega_bandeira/screens/game/timeGame.dart';
import 'package:poc_pega_bandeira/screens/master/home.dart';
import 'package:poc_pega_bandeira/screens/master/quantityMode.dart';
import 'package:poc_pega_bandeira/screens/master/timeMode.dart';
import 'package:poc_pega_bandeira/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pega bandeira',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: AppColors.primary, secondary: AppColors.secondary, background: AppColors.neutral),
        useMaterial3: true,
      ),
      home: const MasterHome(),
      routes: {
        'home': (ctx) => const MasterHome(),
        '/timeMode': (ctx) => const TimeMode(),
        '/quantityMode': (ctx) => const QuantityMode(),
        '/timeGame': (ctx) => TimeGame(),
      },
    );
  }
}
