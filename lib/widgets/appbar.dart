import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

AppBar myAppBar(BuildContext context, String title, {color = Colors.white}) {
  return AppBar(
    // centerTitle: true,
    backgroundColor: color,
    title: title.text.black.xl.bold.make().pOnly(top: 15),
    // iconTheme: IconTheme(),
    leading: FloatingActionButton(
            backgroundColor: Colors.grey[400],
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            onPressed: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios_new))
        .pOnly(left: 15, top: 15),
  );
}
