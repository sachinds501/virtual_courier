import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:virtual_courier/pages/overview.dart';

class AfterSplash extends StatefulWidget {
  const AfterSplash({Key? key}) : super(key: key);

  @override
  State<AfterSplash> createState() => _AfterSplashState();
}

class _AfterSplashState extends State<AfterSplash> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const OverView())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 140, width: 280, child: Placeholder()),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Virtual',
                  style: GoogleFonts.lora(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 38,
                  ),
                ),
                TextSpan(
                  text: ' Courier',
                  style: GoogleFonts.lora(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 38,
                  ),
                ),
              ],
            ),
          ),
        ],
      ).centered(),
    );
  }
}
