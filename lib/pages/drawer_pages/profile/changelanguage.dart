import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({Key? key}) : super(key: key);

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  String dropdownValue = 'select';

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
      body: Center(
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>['select', 'Two', 'Free', 'Four']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
