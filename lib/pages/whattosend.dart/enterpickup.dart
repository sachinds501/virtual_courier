// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class PickUp extends StatefulWidget {
  const PickUp({Key? key}) : super(key: key);

  @override
  State<PickUp> createState() => PickUpState();
}

class PickUpState extends State<PickUp> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      child: Container(
        width: MediaQuery.of(context).size.width,
        // ignore: prefer_const_literals_to_create_immutables
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 20.0,
          ),
        ]),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close)),
                "Enter Pickup".text.xl.bold.make(),
              ],
            ).pOnly(bottom: 10),
            Column(children: [
              VxTwoRow(
                left: Icon(
                  Icons.location_on,
                  color: Colors.green,
                ),
                right: Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: 'Enter Pickup',
                    ),
                  ).cornerRadius(10),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              VxTwoRow(
                left: Icon(
                  Icons.location_on,
                  color: Colors.green,
                ),
                right: Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: 'Enter Pickup',
                    ),
                  ).cornerRadius(10),
                ),
              ),
            ]).backgroundColor(Colors.white),
          ],
        ).p12(),
      ),
    );
  }
}
