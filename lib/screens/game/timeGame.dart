import 'dart:async';

import 'package:flutter/material.dart';
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
  int _remainingMinutes = 0;
  int _remainingSeconds = 10;
  bool then = false;

  void addGreen() {
    setState(() {
      $green++;
    });
  }

  void addYellow() {
    setState(() {
      $yellow++;
    });
  }

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      setState(() {
        if (_remainingSeconds == 0) {
          if (_remainingMinutes == 0) {
            then = true;
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
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 150, vertical: 0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Faltam',
                                      style: TextStyle(
                                          fontFamily: 'Comic',
                                          fontSize: 15,
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
                                          fontSize: 75,
                                          color: AppColors.primary)),
                                ],
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('minutos',
                                      style: TextStyle(
                                          fontFamily: 'Comic',
                                          fontSize: 15,
                                          color: AppColors.secondary)),
                                ],
                              ),
                            ]),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: addYellow,
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
                        onTap: addGreen,
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
            : Center(
              child: Column(
                  children: [
                    Image.network('assets/trafoeupng.png'),
                    const Text('Vitória'),
                      
                    ],
                ),
            ));
  }
}
