// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class PanelPage extends StatefulWidget {
  const PanelPage({Key? key}) : super(key: key);

  @override
  State<PanelPage> createState() => _PanelPageState();
}

class _PanelPageState extends State<PanelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close)),
                "Enter Pickup".text.xl2.bold.make(),
              ],
            ).pOnly(bottom: 10),
            Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: 'Enter Pickup',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: 'Enter Pickup',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: 'Enter Pickup',
                  ),
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text('Done Button Pressed'),
                  duration: const Duration(seconds: 1),
                ));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      context.theme.colorScheme.secondary),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  )),
              child: "Done".text.xl2.black.bold.make(),
            ).wh(MediaQuery.of(context).size.width, 50),
          ],
        ).p16(),
      ),
    );
  }
}
