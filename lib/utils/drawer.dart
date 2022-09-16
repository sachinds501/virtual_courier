// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:virtual_courier/pages/drawer_pages/help.dart';
import 'package:virtual_courier/pages/drawer_pages/order.dart';
import 'package:virtual_courier/pages/drawer_pages/payment.dart';
import 'package:virtual_courier/pages/drawer_pages/profile/view_profile.dart';
import 'package:virtual_courier/pages/drawer_pages/promocode.dart';
import 'package:virtual_courier/utils/routes.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);

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
                    onTap: () {
                      Navigator.pushNamed(context, MyRoutes.viewprofileroute);
                    },
                    leading: CircleAvatar(
                      maxRadius: 28,
                      backgroundColor: Colors.transparent,
                      child: Image.asset(
                        'assets/images/user.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    title: 'Edward Mwongera'.text.size(16).bold.make(),
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
            ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: icons[index],
                    title: strings[index].text.xl.make(),
                    onTap: () {
                      // Update the state of the app.
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => routes[index]));
                    },
                  );
                }).h(500),
          ],
        ),
      ),
    );
  }

  List<Icon> icons = [
    Icon(
      Icons.person_outline_rounded,
      color: Colors.black,
    ),
    Icon(
      CupertinoIcons.creditcard,
      color: Colors.black,
    ),
    Icon(
      Icons.pages_outlined,
      color: Colors.black,
    ),
    Icon(
      Icons.discount_outlined,
      color: Colors.black,
    ),
    Icon(
      Icons.help_outline,
      color: Colors.black,
    ),
  ];
  List<String> strings = ['Profile', 'Payment', 'Orders', 'Promotions', 'Help'];
  List<Widget> routes = [
    ViewProfilePage(),
    PaymentPage(),
    OrderPage(),
    PromocodePage(),
    Help()
  ];
}
