import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/appbar.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, 'Help', color: Colors.white),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Contact Us:".text.xl2.bold.make(),
            HeightBox(10),
            "Mob. 1: 9443342312".text.xl.make(),
            "Mob. 2: 9443342313".text.xl.make(),
            "email: virtualcourier@info.in".text.xl.make(),
            HeightBox(10),
            ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.chat_bubble),
                label: 'Chat with us'.text.make()),
            ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.question_mark),
                label: 'File a complaint'.text.make())
          ],
        ).p16(),
      ),
    );
  }
}
