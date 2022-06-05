import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ViewProfilePage extends StatefulWidget {
  const ViewProfilePage({Key? key}) : super(key: key);

  @override
  State<ViewProfilePage> createState() => _ViewProfilePageState();
}

class _ViewProfilePageState extends State<ViewProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: "ViewProfilePage".text.xl3.make(),
    ));
  }
}
