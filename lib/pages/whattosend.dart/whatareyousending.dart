// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:virtual_courier/pages/whattosend.dart/enterpickup.dart';
import 'package:virtual_courier/pages/whattosend.dart/itemsize.dart';
import 'package:virtual_courier/pages/whattosend.dart/sendingitem.dart';
import 'package:virtual_courier/utils/routes.dart';

class WhatToSend extends StatefulWidget {
  const WhatToSend({Key? key}) : super(key: key);

  @override
  State<WhatToSend> createState() => _WhatToSendState();
}

class _WhatToSendState extends State<WhatToSend> {
  bool? value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(
          builder: (context) => SafeArea(
                child: Column(
                  children: [
                    PickUp(),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "What are you sending",
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[600]),
                          ),
                          SizedBox(
                            height: 70,
                            child: SendingItem(),
                          ),
                          const Spacer(),
                          Text(
                            "Parcel Value",
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[600]),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[100],
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: '100 Rs.',
                            ),
                          ).cornerRadius(15),
                          const Spacer(),
                          Text(
                            "What size of load do you want delivered",
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[600]),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ItemSize(),
                          const Spacer(),
                          Row(
                            children: [
                              Checkbox(
                                value: value,
                                activeColor:
                                    Theme.of(context).colorScheme.secondary,
                                onChanged: (bool? value) {
                                  setState(() {
                                    this.value = value;
                                  });
                                },
                              ),
                              Text(
                                "I am not sending any Restricted Items",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.grey[600]),
                              )
                            ],
                          ),
                          if (value = true)
                            ElevatedButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text('Continue Button Pressed'),
                                  duration: Duration(seconds: 1),
                                ));
                                Navigator.pushNamed(
                                    context, MyRoutes.choosemediumroute);
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    context.theme.colorScheme.secondary),
                                shape: MaterialStateProperty.all(
                                  const StadiumBorder(),
                                ),
                              ),
                              child: "Continue".text.xl.white.bold.make(),
                            ).wh(MediaQuery.of(context).size.width, 50),
                        ],
                      ).p24(),
                    ),
                  ],
                ),
              )),
    );
  }
}
