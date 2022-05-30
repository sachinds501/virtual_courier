import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemSize extends StatefulWidget {
  const ItemSize({Key? key}) : super(key: key);

  @override
  State<ItemSize> createState() => _ItemSizeState();
}

class _ItemSizeState extends State<ItemSize> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 5,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 2.3,
            color: Colors.red[50],
            child: VxTwoColumn(
                    top: SizedBox(
                      height: 80,
                      width: 80,
                      child: Image.network(
                          'https://blogger.googleusercontent.com/img/a/AVvXsEjN40lQs9w1tHJ1AFl38bGmYDv_R-VAUF7T9QdZ6iSKn0yksy-EjeObM2eJ4V4Aoc0eCU5-bprNRnYLacwqaeAG7rAeKPo5PfrPu0zU5Z9jsXbesuFCA8Nh7gFQJZDC-ngn7U5-bnajV059p_MJXpRxAqWIkwttb-u_S2xixJcCOmo7UXjJ2ZG9LxOZ'),
                    ).centered(),
                    bottom: "Small".text.xl.bold.make().centered())
                .p12(),
          ).cornerRadius(20).p8(),
          Container(
            width: MediaQuery.of(context).size.width / 2.3,
            color: Theme.of(context).colorScheme.secondary,
            child: VxTwoColumn(
                    top: SizedBox(
                      height: 80,
                      width: 80,
                      child: Image.network(
                          'https://blogger.googleusercontent.com/img/a/AVvXsEi4gl2l2M25a_zgR32UrbLuMhoopeKZf9cSHfewIoDKz8ukoxgtqQh7eAMPlAaqngIix9ThlT3b8_-zze8HEbbCyVKE9NNUuhW2gXYnB1rjaVDMh_xAUj-iwzPwISwTfuVovp9_NiQvWyCsrKNJx5TVmctwbzuZ9xxySXc77hPoiq4I4_tjCSMhpU2Y'),
                    ).centered(),
                    bottom: "Medium".text.xl.bold.make().centered())
                .p12(),
          ).cornerRadius(20).p8(),
          Container(
            width: MediaQuery.of(context).size.width / 2.3,
            color: Colors.red[50],
            child: VxTwoColumn(
                    top: SizedBox(
                      height: 80,
                      width: 80,
                      child: Image.network(
                          'https://blogger.googleusercontent.com/img/a/AVvXsEi1VriA-WoBLDuUAKTJejjMaF3Flnz4wOOU9W2pJ6VK6RjYRC6L1Ct5btjPqDiZ0FJ2xLuGFgBPlXmNH5y9othPeop9ljgpOsUcXU1FYBBdQl8JpBTn5BwP-Hng8FJCs9zeuvRTurfX43nhYZefFk69DkLxirRizobQLMUwP1h3OuszSHMRAzImj02-'),
                    ).centered(),
                    bottom: "Large".text.xl.bold.make().centered())
                .p12(),
          ).cornerRadius(20).p8(),
        ],
      ),
    );
  }
}
