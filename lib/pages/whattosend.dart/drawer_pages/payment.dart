import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: "PaymentPage".text.xl3.make(),
    ));
  }
}
