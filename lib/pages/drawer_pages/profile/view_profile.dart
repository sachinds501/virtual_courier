// ignore_for_file: prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:virtual_courier/pages/drawer_pages/profile/changelanguage.dart';
import 'package:virtual_courier/pages/drawer_pages/profile/changepassword.dart';
import 'package:virtual_courier/pages/loginpage/loginpage.dart';
import '../../../widgets/other_widgets.dart';
import 'edit_profile.dart';

class ViewProfilePage extends StatefulWidget {
  const ViewProfilePage({Key? key}) : super(key: key);

  @override
  State<ViewProfilePage> createState() => _ViewProfilePageState();
}

class _ViewProfilePageState extends State<ViewProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // centerTitle: true,
          title: 'Profile'.text.black.xl.bold.make().pOnly(top: 15),
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
          actions: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: PopupMenuButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    onSelected: (result) {
                      if (result == 1) {
                        Navigator.push(
                            context, SizeTransition5(const EditProfilePage()));
                      } else if (result == 2) {
                        Navigator.push(
                            context, SizeTransition5(const Password()));
                      } else if (result == 3) {
                        Navigator.push(
                            context, SizeTransition5(const ChangeLanguage()));
                      } else {
                        FirebaseAuth.instance.signOut();
                        runApp(MaterialApp(
                          home: LoginPage(),
                        ));
                      }
                    },
                    itemBuilder: (BuildContext context) => [
                          PopupMenuItem(
                            child: Container(
                                width: 170.0,
                                child: Text(
                                  "Edit Profile",
                                  style: TextStyle(fontSize: 13),
                                )),
                            value: 1,
                          ),
                          PopupMenuItem(
                            child: Text(
                              "Change Password",
                              style: TextStyle(fontSize: 13),
                            ),
                            value: 2,
                          ),
                          PopupMenuItem(
                            child: Text(
                              "Change Language",
                              style: TextStyle(fontSize: 13),
                            ),
                            value: 3,
                          ),
                          PopupMenuItem(
                            child: Text(
                              "Log Out",
                              style: TextStyle(fontSize: 13),
                            ),
                            value: 4,
                          )
                        ]))
          ],
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                title: 'Name'.text.bold.make(),
                subtitle: FirebaseAuth.instance.currentUser != null
                    ? FirebaseAuth.instance.currentUser!.displayName
                        .toString()
                        .text
                        .size(14)
                        .bold
                        .make()
                    : "Krishna".text.size(14).bold.make(),
              ),
              Divider(
                thickness: 2,
              ),
              ListTile(
                title: 'Email Address'.text.bold.make(),
                subtitle: FirebaseAuth.instance.currentUser != null
                    ? FirebaseAuth.instance.currentUser!.email
                        .toString()
                        .text
                        .size(14)
                        .bold
                        .make()
                    : "Krishna".text.size(14).bold.make(),
              ),
              Divider(
                thickness: 2,
              ),
              ListTile(
                title: 'Phone Number'.text.bold.make(),
                subtitle: '0725 5654 5653'.text.size(14).make(),
              ),
              Divider(
                thickness: 2,
              ),
            ],
          ).p12(),
        ));
  }

  // void _signOut() async {
  //   await FirebaseAuth.instance.signOut();

  //   runApp(MaterialApp(
  //     home: LoginPage(),
  //   ));
  // }
}
