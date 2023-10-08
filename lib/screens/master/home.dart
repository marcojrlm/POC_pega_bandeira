import 'package:flutter/material.dart';
import 'package:poc_pega_bandeira/utils/colors.dart';
import 'package:poc_pega_bandeira/widgets/button.dart';

class MasterHome extends StatefulWidget {
  const MasterHome({super.key});

  @override
  State<MasterHome> createState() => _MasterHomeState();
}

class _MasterHomeState extends State<MasterHome> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.neutral,
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/logo.jpg"),
              radius: 25,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Professora Caterine",
                  style: TextStyle(
                      fontFamily: 'Comic', color: AppColors.secondary)),
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyButton(
                text: "Modo tempo",
                onPressed: () => Navigator.pushNamed(context, '/timeMode')),
            const SizedBox(
              height: 20,
            ),
            MyButton(
                text: "Modo quantidade",
                color: AppColors.secondary,
                width: 0.6,
                onPressed: () => Navigator.pushNamed(context, '/quantityMode')),
          ],
        ),
      ),
    );
  }
}
