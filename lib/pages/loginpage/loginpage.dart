// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:virtual_courier/pages/loginpage/materialsegmentcontrol.dart';

import '../../widgets/other_widgets.dart';
import '../map/homemappage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Something Went Wrong'));
              } else if (snapshot.hasData) {
                return HomeMapPage();
              } else {
                return SafeArea(
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
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
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
                        onPressed: () async {
                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //   content: const Text('Login In with Google pressed'),
                          //   duration: const Duration(seconds: 1),
                          // ));
                          await signInWithGoogle();
                          setState(() {});
                        },
                      ).wh(MediaQuery.of(context).size.width, 50),
                      SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: TextButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: const Text('forgot button pressed'),
                                duration: const Duration(seconds: 1),
                              ));
                            },
                            child: "Forgot Password".text.gray500.make()),
                      )
                    ],
                  ).p32(),
                ));
              }
            }),
      );

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // navigate to homescreen
    Navigator.of(context).push(SizeTransition5(HomeMapPage()));

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
