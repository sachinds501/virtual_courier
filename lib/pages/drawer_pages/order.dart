import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/appbar.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, 'Your Orders'),
      body: ListView.separated(
              itemBuilder: ((context, index) => ListTile(
                    title:
                        "Santram Mandir, Nadiad".text.bodyText2(context).make(),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "August 29, 2022 12:51:31"
                            .text
                            .bodyText1(context)
                            .caption(context)
                            .make(),
                        "YOU CANCELLED".text.bodyText1(context).red500.make(),
                      ],
                    ).py4(),
                    onTap: () {},
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                  )),
              separatorBuilder: ((context, index) => const Divider(
                    thickness: 2,
                  )),
              itemCount: 5)
          .p16(),
    );
  }
}
