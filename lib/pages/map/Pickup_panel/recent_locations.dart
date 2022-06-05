// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class RecentLocations extends StatefulWidget {
  const RecentLocations({Key? key}) : super(key: key);

  @override
  State<RecentLocations> createState() => _RecentLocationsState();
}

class _RecentLocationsState extends State<RecentLocations> {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Container(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height / 3),
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            ListTile(
              title: 'Home'.text.size(12).bold.make(),
              leading: const Icon(Icons.access_time),
              onTap: () {},
              subtitle: "Kileleshwa, Likoni Lane, Nairobi, Kenya"
                  .text
                  .size(10)
                  .make(),
            ),
            ListTile(
              title: 'Work'.text.size(12).bold.make(),
              leading: const Icon(Icons.access_time),
              subtitle: "Kileleshwa, Likoni Lane, Nairobi, Kenya"
                  .text
                  .size(10)
                  .make(),
            ),
            ListTile(
              title: 'Kileleshwa'.text.size(12).bold.make(),
              leading: const Icon(Icons.access_time),
            ),
            ListTile(
              title: 'Work'.text.size(12).bold.make(),
              leading: const Icon(Icons.access_time),
              subtitle: "Kileleshwa, Likoni Lane, Nairobi, Kenya"
                  .text
                  .size(10)
                  .make(),
            ),
            ListTile(
              title: 'Home'.text.size(12).bold.make(),
              leading: const Icon(Icons.access_time),
              subtitle: "Kileleshwa, Likoni Lane, Nairobi, Kenya"
                  .text
                  .size(10)
                  .make(),
            ),
            ListTile(
              title: 'Kileleshwa'.text.size(12).bold.make(),
              leading: const Icon(Icons.access_time),
            ),
          ],
        ),
      ),
    );
  }
}
