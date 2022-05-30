// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:virtual_courier/utils/routes.dart';
import 'package:virtual_courier/widgets/themes.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final Color myColor = Theme.of(context).colorScheme.secondary;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const MaterialSegment(),
              SizedBox(
                height: 80,
              ),
              "Sign Up".text.xl3.bold.make().pOnly(bottom: 10),
              "Welcome to Virtual Courier"
                  .text
                  .minFontSize(14)
                  .caption(context)
                  .make(),
              SizedBox(
                height: 100,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 140,
                    child: firstName(),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 140,
                    child: lastName(),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              email(),
              SizedBox(
                height: 10,
              ),
              password(),
              SizedBox(
                height: 10,
              ),
              "Seems good, we suggest to make it stronger".text.bold.xs.make(),
              SizedBox(height: 15),
              VxTwoRow(
                  left: Icon(
                    Icons.circle,
                    size: 12,
                    color: myColor,
                  ),
                  right: "Contains at least one uppercase"
                      .text
                      .maxFontSize(12)
                      .make()),
              VxTwoRow(
                  left: Icon(
                    Icons.circle,
                    size: 12,
                    color: myColor,
                  ),
                  right: "Contains at least one number"
                      .text
                      .maxFontSize(12)
                      .make()),
              VxTwoRow(
                  left: Icon(
                    Icons.circle,
                    size: 12,
                  ),
                  right: "Contains at least one special character"
                      .text
                      .maxFontSize(12)
                      .make()),
              SizedBox(
                height: 50,
              ),
              letsGo(context).wh(MediaQuery.of(context).size.width, 50),
              SizedBox(
                height: 20,
              ),
              signUpWithGoogle(context)
                  .wh(MediaQuery.of(context).size.width, 50),
              SizedBox(
                height: 40,
              ),
            ],
          ).p32(),
        ),
      ),
    );
  }

  SignInButton signUpWithGoogle(BuildContext context) {
    return SignInButton(
      Buttons.Google,
      text: "Sign Up with Google",
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('Login In with Google pressed'),
          duration: const Duration(seconds: 1),
        ));
      },
    );
  }

  ElevatedButton letsGo(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('Login Button Pressed'),
          duration: const Duration(seconds: 1),
        ));
        Navigator.pushNamed(context, MyRoutes.homemappageroute);
      },
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(context.theme.colorScheme.secondary),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          )),
      child: "Lets Go!".text.black.bold.make(),
    );
  }

  TextFormField password() {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(8),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: MyTheme.cyberYellowColor, width: 5),
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
    );
  }

  TextFormField email() {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(8),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary, width: 5),
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
    );
  }

  TextFormField lastName() {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(8),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary, width: 5),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        hintText: " Last Name",
        labelText: 'Last Name',
        labelStyle: TextStyle(color: Colors.grey[400]),
      ),
      onSaved: (String? value) {
        // This optional block of code can be used to run
        // code when the user saves the form.
      },
      validator: (String? value) {
        return null;
      },
    );
  }

  TextFormField firstName() {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(8),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary, width: 5),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        hintText: " First Name",
        labelText: 'First Name',
        labelStyle: TextStyle(color: Colors.grey[400]),
      ),
      onSaved: (String? value) {
        // This optional block of code can be used to run
        // code when the user saves the form.
      },
      validator: (String? value) {
        return null;
      },
    );
  }
}
