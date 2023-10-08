import 'dart:async';
import 'dart:developer' as developer;

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:poc_pega_bandeira/utils/colors.dart';

class TimeGame extends StatefulWidget {
  TimeGame({super.key});

  @override
  State<TimeGame> createState() => _TimeGameState();
}

class _TimeGameState extends State<TimeGame> {
  var $green = 0;
  var $yellow = 0;

  late Timer _timer;
  int _remainingMinutes = 50;
  int _remainingSeconds = 5;
  bool then = false;

  FlutterBlue flutterBlue = FlutterBlue.instance;
  BluetoothDevice? connectedDevice;

  addGreen() async {
    setState(() {
      $green++;
    });
    await player.setSource(AssetSource('green.mp3'));
    await player.resume();
  }

  addYellow() async {
    setState(() {
      $yellow++;
    });
    await player.setSource(AssetSource('yellow.mp3'));
    await player.resume();
  }

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  final player = AudioPlayer();

  victorySound() async {
    await player.setSource(AssetSource('vitoria.mp3'));
    await player.resume();
  }

  Future<void> connectToDevice() async {
    developer.log('1');
    flutterBlue.scan(timeout: const Duration(seconds: 10)).listen((scanResult) {
      developer.log(scanResult.device.type.toString());
      if (scanResult.device.name == 'Nome do Seu Dispositivo') {
        developer.log('3');
        scanResult.device.connect().then((connectedDevice) {
          developer.log('4');
          setState(() {
            connectedDevice = connectedDevice;
          });
        });
      }
    });
  }

  void _startCountdown() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      setState(() {
        if (_remainingSeconds == 0) {
          if (_remainingMinutes == 0) {
            then = true;
            victorySound();
            timer.cancel();
          } else {
            _remainingMinutes--;
            _remainingSeconds = 59;
          }
        } else {
          _remainingSeconds--;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: !then
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: 300,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Faltam',
                                      style: TextStyle(
                                          fontFamily: 'Comic',
                                          fontSize: 25,
                                          color: AppColors.secondary)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      '$_remainingMinutes:${_remainingSeconds.toString().padLeft(2, '0')}',
                                      style: const TextStyle(
                                          fontFamily: 'Comic',
                                          fontSize: 100,
                                          color: AppColors.primary)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      await connectToDevice();
                                    },
                                    child: const Text('minutos',
                                        style: TextStyle(
                                            fontFamily: 'Comic',
                                            fontSize: 25,
                                            color: AppColors.secondary)),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await addYellow();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.5,
                          color: Colors.yellow,
                          child: Center(
                            child: Text($yellow.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 80,
                                    fontFamily: 'Comic')),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await addGreen();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.5,
                          color: Colors.green,
                          child: Center(
                            child: Text($green.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 80,
                                    fontFamily: 'Comic')),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            : Scaffold(
                body: SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 1,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/trafoeupng.png'),
                        Text(
                          $yellow == $green ? 'Empate' : 'Vitória',
                          style: const TextStyle(
                              fontSize: 60,
                              color: AppColors.secondary,
                              fontFamily: 'Comic'),
                        ),
                        $green != $yellow
                            ? Text(
                                "A equipe ${$green > $yellow ? 'verde' : 'amarelo'} ganhou",
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: AppColors.secondary,
                                    fontFamily: 'Comic'))
                            : Container(),
                        Image.asset('assets/Logooby.png'),
                      ]),
                ),
              ));
  }
}
