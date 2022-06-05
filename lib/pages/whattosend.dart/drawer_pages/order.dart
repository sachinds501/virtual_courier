import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: "OrderPage".text.xl3.make(),
    ));
  }
}
