import 'package:flutter/material.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:virtual_courier/utils/routes.dart';

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
              Navigator.pushNamed(context, MyRoutes.signupRoute);
            }
            if (index == 0) {
              Navigator.pushNamed(context, MyRoutes.loginRoute);
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
