// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:virtual_courier/pages/whattosend.dart/drawer_pages/view_profile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: DrawerHeader(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 110,
              child: DrawerHeader(
                padding: EdgeInsets.zero,
                child: Center(
                  child: ListTile(
                    onTap: () {},
                    leading: CircleAvatar(
                      maxRadius: 28,
                      backgroundColor: Colors.transparent,
                      child: Image.network(
                        'https://www.shareicon.net/data/2017/02/15/878685_user_512x512.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    title: 'Edward Mwongera'.text.size(10).extraBold.make(),
                    subtitle: 'View Profile'
                        .text
                        .size(12)
                        .bold
                        .caption(context)
                        .make(),
                  ),
                ),
              ),
            ),
            Divider(
              endIndent: 10,
              indent: 10,
              thickness: 1,
              color: Colors.black,
            ),
            ListTile(
              leading: const Icon(
                Icons.person_outline_rounded,
                color: Colors.black,
              ),
              title: 'Profile'.text.bold.make(),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: const Icon(
                CupertinoIcons.creditcard,
                color: Colors.black,
              ),
              title: 'Payment'.text.bold.make(),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.pages_outlined,
                color: Colors.black,
              ),
              title: 'Orders'.text.bold.make(),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.discount_outlined,
                color: Colors.black,
              ),
              title: 'Promotions'.text.bold.make(),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.help_outline,
                color: Colors.black,
              ),
              title: 'Help'.text.bold.make(),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
    );
  }
}
