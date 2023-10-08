import 'package:flutter/material.dart';
import 'package:poc_pega_bandeira/utils/colors.dart';

class MyButton extends StatelessWidget {
  MyButton(
      {super.key,
      this.width,
      this.height,
      this.color,
      this.textSize,
      required this.text,
      required this.onPressed});

  var width;
  var height;
  var color;
  var text;
  var textSize;

  final VoidCallback
      onPressed; // Um callback que não recebe argumentos e não retorna valor

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: width ?? 0.6,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
          backgroundColor: color ?? AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: textSize ?? 20,
              fontFamily: 'Comic'),
        ),
      ),
    );
  }
}
