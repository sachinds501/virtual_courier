// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:virtual_courier/pages/loginpage/materialsegmentcontrol.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MaterialSegment(),
                SizedBox(
                  height: 80,
                ),
                "Log In".text.xl3.bold.make().pOnly(bottom: 10),
                "Welcome to Virtual Courier please fill the details below to Log In"
                    .text
                    .minFontSize(13)
                    .caption(context)
                    .make(),
                SizedBox(
                  height: 90,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                          width: 5),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    hintText: "Email",
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.grey[400]),
                  ),
                  onSaved: (String? value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                  },
                  validator: (String? value) {
                    return (value != null && value.contains('@'))
                        ? null
                        : 'not valid email';
                  },
                ).p4(),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                          width: 5),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    hintText: " Password",
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.grey[400]),
                  ),
                  obscureText: true,
                  validator: (String? value) {
                    return (value != null && value.length >= 8)
                        ? null
                        : 'Password must have more than 8 characters.';
                  },
                ).p4(),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text('Login Button Pressed'),
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
                  child: "Lets Go!".text.black.bold.make(),
                ).wh(MediaQuery.of(context).size.width, 50),
                SizedBox(
                  height: 20,
                ),
                SignInButton(
                  Buttons.Google,
                  text: "Login In with Google",
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text('Login In with Google pressed'),
                      duration: const Duration(seconds: 1),
                    ));
                  },
                ).wh(MediaQuery.of(context).size.width, 50),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: const Text('forgot button pressed'),
                          duration: const Duration(seconds: 1),
                        ));
                      },
                      child: "Forgot Password".text.gray500.make()),
                )
              ],
            ).p32(),
          ),
        ),
      );
}
