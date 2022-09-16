// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:virtual_courier/pages/loginpage/loginpage.dart';
import 'package:virtual_courier/pages/loginpage/signuppage.dart';
import 'package:virtual_courier/widgets/other_widgets.dart';

class MaterialSegment extends StatefulWidget {
  const MaterialSegment({Key? key}) : super(key: key);

  @override
  State<MaterialSegment> createState() => _MaterialSegmentState();
}

class _MaterialSegmentState extends State<MaterialSegment> {
  int _currentSelection = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MaterialSegmentedControl(
          borderColor: Colors.transparent,
          children: _children,
          selectionIndex: _currentSelection,
          selectedColor: Theme.of(context).colorScheme.secondary,
          unselectedColor: const Color.fromARGB(85, 255, 213, 33),
          horizontalPadding: EdgeInsets.zero,
          borderRadius: 32.0,
          onSegmentChosen: (int index) {
            if (index == 1) {
              Navigator.push(context, SizeTransition5(const SignUp()));
            }
            if (index == 0) {
              Navigator.push(context, SizeTransition5(const LoginPage()));
            }
            setState(() {
              _currentSelection = index;
            });
          },
        ),
      ],
    );
  }

  final Map<int, Widget> _children = {
    0: Container(
      width: 90,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: const Center(
        child: Text(
          "Log In",
          style: TextStyle(color: Colors.black, fontSize: 13),
        ),
      ),
    ),
    1: Container(
      width: 90,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: const Center(
        child: Text(
          "Sign Up",
          style: TextStyle(color: Colors.black, fontSize: 13),
        ),
      ),
    ),
  };
}
