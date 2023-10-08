import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:poc_pega_bandeira/utils/colors.dart';

class QuantityGame extends StatefulWidget {
  const QuantityGame({super.key});

  @override
  State<QuantityGame> createState() => _QuantityGameState();
}

class _QuantityGameState extends State<QuantityGame> {
  var $flags = 10;
  var $yellowFlags = 0;
  var $greenFlags = 0;
  final player = AudioPlayer();

  addGreen() async {
    setState(() {
      $greenFlags++;
    });

    if ($greenFlags == $flags) {
      victorySound();
    } else {
      await player.setSource(AssetSource('green.mp3'));
      await player.resume();
    }
  }

  addYellow() async {
    setState(() {
      $yellowFlags++;
    });

    if ($yellowFlags == $flags) {
      victorySound();
    } else {
      await player.setSource(AssetSource('yellow.mp3'));
      await player.resume();
    }
  }

  victorySound() async {
    await player.setSource(AssetSource('vitoria.mp3'));
    await player.resume();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ($yellowFlags < $flags && $greenFlags < $flags)
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text($flags.toString(),
                                      style: const TextStyle(
                                          fontFamily: 'Comic',
                                          fontSize: 120,
                                          color: AppColors.primary)),
                                ],
                              ),
                              const Text('bandeiras',
                                  style: TextStyle(
                                      fontFamily: 'Comic',
                                      fontSize: 25,
                                      color: AppColors.secondary)),
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
                            child: Text($yellowFlags.toString(),
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
                            child: Text($greenFlags.toString(),
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
                            "A equipe ${$greenFlags > $yellowFlags ? 'verde' : 'amarelo'} ganhou",
                            style: const TextStyle(
                                fontSize: 20,
                                color: AppColors.secondary,
                                fontFamily: 'Comic')),
                        Image.asset('assets/Logooby.png'),
                      ]),
                ),
              ));
  }
}
