import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: "EditProfilePage".text.xl3.make(),
    ));
  }
}
