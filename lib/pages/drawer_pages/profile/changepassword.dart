// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../../widgets/appbar.dart';

class Password extends StatefulWidget {
  const Password({Key? key}) : super(key: key);

  @override
  State<Password> createState() => _PasswordState();
}

final _formKey2 = GlobalKey<FormState>();

class _PasswordState extends State<Password> {
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  @override
  void dispose() {
    _confirmPass.dispose();
    _pass.dispose();
    super.dispose();
  }

  bool _oldpasswordVisibility = false;
  bool _newpasswordVisibility = false;
  bool _passwordMatched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(context, 'Change Password'),
        body: SafeArea(
          child: Form(
            key: _formKey2,
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
                      setState(() {});
                    },
                    title: 'Old Password'.text.bold.make(),
                    subtitle: TextFormField(
                        obscureText:
                            _oldpasswordVisibility == true ? false : true,
                        cursorColor: Theme.of(context).colorScheme.secondary,
                        cursorHeight: 30,
                        cursorWidth: 3,
                        decoration: InputDecoration(
                          suffixIcon: _oldpasswordVisibility == true
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _oldpasswordVisibility = false;
                                    });
                                  },
                                  icon: Icon(CupertinoIcons.eye),
                                )
                              : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _oldpasswordVisibility = true;
                                    });
                                  },
                                  icon: Icon(CupertinoIcons.eye_slash),
                                ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: 'Old Password',
                          // prefixText: _email,
                        ),
                        onFieldSubmitted: (value) {},
                        onSaved: (value) {
                          setState(() {});
                        }).cornerRadius(15).h(50).pOnly(top: 10),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    onTap: () {
                      setState(() {});
                    },
                    title: 'New Password'.text.bold.make(),
                    subtitle: TextFormField(
                        controller: _pass,
                        obscureText:
                            _newpasswordVisibility == true ? false : true,
                        cursorColor: Theme.of(context).colorScheme.secondary,
                        cursorHeight: 30,
                        cursorWidth: 3,
                        decoration: InputDecoration(
                          suffixIcon: _newpasswordVisibility == true
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _newpasswordVisibility = false;
                                    });
                                  },
                                  icon: Icon(CupertinoIcons.eye),
                                )
                              : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _newpasswordVisibility = true;
                                    });
                                  },
                                  icon: Icon(CupertinoIcons.eye_slash),
                                ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: 'New Password',
                        ),
                        onSaved: (value) {
                          // _newPassword = value;
                          setState(() {});
                        },
                        onChanged: (String value) {
                          if (value == _confirmPass.text && value.isNotEmpty) {
                            setState(() {
                              _passwordMatched = true;
                            });
                          } else {
                            setState(() {
                              _passwordMatched = false;
                            });
                          }
                        },
                        validator: (val) {
                          if (val!.isEmpty) {}
                          return null;
                        }).cornerRadius(15).h(50).pOnly(top: 10),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    onTap: () {
                      setState(() {});
                    },
                    title: 'Confirm New Password'.text.bold.make(),
                    subtitle: TextFormField(
                      controller: _confirmPass,
                      cursorColor: Theme.of(context).colorScheme.secondary,
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
                        hintText: 'Create New Password',
                        // prefixText: _email,
                      ),
                      onFieldSubmitted: (value) {},
                      onSaved: (value) {
                        setState(() {});
                      },
                      onChanged: (String value) async {
                        if (value == _pass.text && value.isNotEmpty) {
                          setState(() {
                            _passwordMatched = true;
                          });
                        } else {
                          setState(() {
                            _passwordMatched = false;
                          });
                        }
                      },
                      validator: (val) {
                        if (val!.isEmpty && val.length < 8) {
                          'Password length must have atleast 8 characters';
                        }
                        if (val == _pass.text) {
                          setState(() {
                            _passwordMatched = true;
                          });
                        }
                        return null;
                      },
                    ).cornerRadius(15).h(50).pOnly(top: 10),
                  ),
                  _passwordMatched == true
                      ? "Password matched"
                          .text
                          .green500
                          .makeCentered()
                          .pOnly(top: 10)
                      : "Password doesn't matched"
                          .text
                          .red500
                          .makeCentered()
                          .pOnly(top: 10),
                  // Spacer(),
                  SizedBox(
                    height: 150,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey2.currentState!.validate()) {
                        _formKey2.currentState!.save();
                      }

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text('Change Password Button Pressed'),
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
                    child: "Change Password".text.xl.black.bold.make(),
                  ).wh(MediaQuery.of(context).size.width, 50),
                ],
              ).p12(),
            ),
          ),
        ));
  }
}
