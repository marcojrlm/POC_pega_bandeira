import 'package:flutter/material.dart';
import 'package:poc_pega_bandeira/screens/game/quantityGame.dart';
import 'package:poc_pega_bandeira/screens/game/timeGame.dart';
import 'package:poc_pega_bandeira/screens/master/home.dart';
import 'package:poc_pega_bandeira/screens/master/quantityMode.dart';
import 'package:poc_pega_bandeira/screens/master/timeMode.dart';
import 'package:poc_pega_bandeira/utils/colors.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Certifique-se de que os plugins estejam inicializados
  await Permission.bluetooth.request();
  await Permission.bluetoothAdvertise.request();
  await Permission.bluetoothConnect.request();
  await Permission.bluetoothScan.request();
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
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: AppColors.primary,
            secondary: AppColors.secondary,
            background: AppColors.neutral),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MasterHome(),
      routes: {
        'home': (ctx) => const MasterHome(),
        '/timeMode': (ctx) => const TimeMode(),
        '/quantityMode': (ctx) => const QuantityMode(),
        '/timeGame': (ctx) => TimeGame(),
        '/quantityGame': (ctx) => QuantityGame(),
      },
    );
  }
}
