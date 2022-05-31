// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:virtual_courier/utils/routes.dart';

class PanelPage extends StatefulWidget {
  const PanelPage({Key? key}) : super(key: key);

  @override
  State<PanelPage> createState() => _PanelPageState();
}

class _PanelPageState extends State<PanelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close)),
                "Enter Pickup".text.xl2.bold.make(),
              ],
            ).pOnly(bottom: 10),
            Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: 'Enter Pickup',
                  ),
                ).cornerRadius(10),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: 'Enter Pickup',
                  ),
                ).cornerRadius(10),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: 'Enter Pickup',
                  ),
                ).cornerRadius(10),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            recentSearch(context),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.whattosendroute);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text('Done Button Pressed'),
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
              child: "Continue".text.xl.white.bold.make(),
            ).wh(MediaQuery.of(context).size.width, 50),
          ],
        ).pSymmetric(v: 32, h: 16),
      ),
    );
  }

  Scrollbar recentSearch(BuildContext context) {
    return Scrollbar(
      child: Container(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height / 2.5),
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            ListTile(
              title: 'Home'.text.make(),
              leading: Icon(Icons.access_time),
              subtitle: "Kileleshwa, Likoni Lane, Nairobi, Kenya".text.make(),
            ),
            ListTile(
              title: 'Work'.text.make(),
              leading: Icon(Icons.access_time),
              subtitle: "Kileleshwa, Likoni Lane, Nairobi, Kenya".text.make(),
            ),
            ListTile(
              title: 'Kileleshwa'.text.make(),
              leading: Icon(Icons.access_time),
            ),
            ListTile(
              title: 'Work'.text.make(),
              leading: Icon(Icons.access_time),
              subtitle: "Kileleshwa, Likoni Lane, Nairobi, Kenya".text.make(),
            ),
            ListTile(
              title: 'Home'.text.make(),
              leading: Icon(Icons.access_time),
              subtitle: "Kileleshwa, Likoni Lane, Nairobi, Kenya".text.make(),
            ),
            ListTile(
              title: 'Kileleshwa'.text.make(),
              leading: Icon(Icons.access_time),
            ),
          ],
        ),
      ),
    );
  }
}
