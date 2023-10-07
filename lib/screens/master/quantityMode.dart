import 'package:flutter/material.dart';
import 'package:poc_pega_bandeira/utils/colors.dart';
import 'package:poc_pega_bandeira/widgets/button.dart';

class QuantityMode extends StatelessWidget {
  const QuantityMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Modo quantidade",
              style: TextStyle(
                  fontSize: 30, fontFamily: 'Comic', color: AppColors.secondary),
            ),
            const Text(
              "Regras",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Comic',
                  color: AppColors.primary),
            ),
            const Column(children: [
              Row(
                children: [
                  Icon(
                    Icons.play_arrow,
                    color: AppColors.primary, // Cor do ícone
                  ),
                  Expanded(
                    child: Text(
                      "Neste modo, os participantes competem para capturar o maior número de bandeiras dentro de um tempo determinado pelo professor.",
                      softWrap: true,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Comic',
                          color: AppColors.secondary),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(
                    Icons.play_arrow,
                    color: AppColors.primary, // Cor do ícone
                  ),
                  Expanded(
                    child: Text(
                      "Neste modo, os participantes competem para capturar o maior número de bandeiras dentro de um tempo determinado pelo professor.",
                      softWrap: true,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Comic',
                          color: AppColors.secondary),
                    ),
                  ),
                ],
              ),
            ]),
            Center(
              child: MyButton(
                text: "Iniciar",
                color: AppColors.secondary,
                textSize: 30,
                onPressed: (){},
              ),
            ),
            Center(
              child: Image.network('/assets/Logooby.png', width: 300),
            )
          ],
        ),
      ),
    );
  }
}
