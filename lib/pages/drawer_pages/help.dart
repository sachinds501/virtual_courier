import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: "Help".text.xl3.make(),
    ));
  }
}
