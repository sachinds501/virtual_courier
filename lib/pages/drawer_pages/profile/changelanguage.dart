import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({Key? key}) : super(key: key);

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: 'Change Language'.text.black.xl.bold.make().pOnly(top: 15),
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
      ),
      body: Center(child: "Hello".text.make()),
    );
  }
}
