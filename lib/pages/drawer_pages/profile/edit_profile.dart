// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

final _formKey = GlobalKey<FormState>();

class _EditProfilePageState extends State<EditProfilePage> {
  bool _subtileToTextFormField = false;
  String? _email = 'edward@gmail.com';
  String? _name = 'Edward Mwongera';
  String? _phone = '0725 5445 54655';
  List<bool> _tileno = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // centerTitle: true,
          title: 'Edit Profile'.text.black.xl.bold.make().pOnly(top: 15),
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
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    height: 100,
                    child: ClipOval(
                      child: Image.network(
                        'https://www.shareicon.net/data/2017/02/15/878685_user_512x512.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  ListTile(
                    onTap: () {
                      setState(() {
                        _subtileToTextFormField = true;
                        _tileno[0] = true;
                      });
                    },
                    title: 'Name'.text.bold.make(),
                    subtitle:
                        (_subtileToTextFormField == true && _tileno[0] == true)
                            ? TextFormField(
                                enabled: true,
                                cursorColor:
                                    Theme.of(context).colorScheme.secondary,
                                cursorHeight: 30,
                                cursorWidth: 3,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  hintText: _name,
                                  // prefixText: _email,
                                ),
                                onFieldSubmitted: (value) {
                                  _name = value;
                                },
                                onSaved: (value) {
                                  _name = value;
                                  setState(() {
                                    _subtileToTextFormField = false;
                                  });
                                }).cornerRadius(15).h(50)
                            : Text(_name!),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    onTap: () {
                      setState(() {
                        _subtileToTextFormField = true;
                        _tileno[1] = true;
                      });
                    },
                    title: 'Email Address'.text.bold.make(),
                    subtitle:
                        (_subtileToTextFormField == true && _tileno[1] == true)
                            ? TextFormField(
                                cursorColor:
                                    Theme.of(context).colorScheme.secondary,
                                cursorHeight: 30,
                                cursorWidth: 3,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,

                                  hintText: _email,
                                  // prefixText: _email,
                                ),
                                onSaved: (value) {
                                  _email = value;
                                  setState(() {
                                    _subtileToTextFormField = false;
                                  });
                                },
                                onChanged: (value) {
                                  _name = value;
                                },
                                validator: (value) {
                                  if (!(value!.contains('@'))) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content:
                                          const Text('Incorrect email address'),
                                      duration: const Duration(seconds: 1),
                                    ));
                                  }
                                  return null;
                                },
                              ).cornerRadius(15).h(50)
                            : Text(_email!),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    onTap: () {
                      setState(() {
                        _subtileToTextFormField = true;
                        _tileno[2] = true;
                      });
                    },
                    title: 'Phone Number'.text.bold.make(),
                    subtitle:
                        (_subtileToTextFormField == true && _tileno[2] == true)
                            ? TextFormField(
                                cursorColor:
                                    Theme.of(context).colorScheme.secondary,
                                cursorHeight: 30,
                                cursorWidth: 3,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,

                                  hintText: _phone,
                                  // prefixText: _email,
                                ),
                                onFieldSubmitted: (value) {
                                  _phone = value;
                                },
                                onSaved: (value) {
                                  _phone = value;

                                  setState(() {
                                    _subtileToTextFormField = false;
                                  });
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {}
                                  return null;
                                },
                              ).cornerRadius(15).h(50)
                            : Text(_phone!),
                  ),

                  // Spacer(),
                  SizedBox(
                    height: 180,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                      }

                      _tileno = [false, false, false];
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text('Submit Button Pressed'),
                        duration: const Duration(seconds: 1),
                      ));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          context.theme.colorScheme.secondary),
                      shape: MaterialStateProperty.all(
                        StadiumBorder(),
                      ),
                    ),
                    child: "Submit".text.xl.black.bold.make(),
                  ).wh(MediaQuery.of(context).size.width, 50),
                ],
              ).p12(),
            ),
          ),
        ));
  }
}
