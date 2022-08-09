import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:virtual_courier/widgets/appbar.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: myAppBar(context, 'Select preffered payment method',
          color: Colors.grey[100]),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            'PAYMENT METHOD'.text.bold.make(),
            SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    elevation: 3,
                    color: Colors.white,
                    child: 'Bank Card'
                        .text
                        .gray400
                        .size(12)
                        .align(TextAlign.center)
                        .bold
                        .makeCentered(),
                  ).wOneForth(context).py16().cornerRadius(20),
                  Card(
                    elevation: 3,
                    color: Colors.white,
                    child: 'Cash On Delivery'
                        .text
                        .gray400
                        .size(12)
                        .align(TextAlign.center)
                        .bold
                        .makeCentered(),
                  ).wOneForth(context).py16().cornerRadius(20),
                  Card(
                    elevation: 3,
                    color: Colors.white,
                    child: 'UPI'.text.gray400.size(12).bold.makeCentered(),
                  ).wOneForth(context).py16().cornerRadius(20)
                ],
              ),
            ),
            'PAYMENT DETAILS'.text.bold.make(),
          ],
        ).p16(),
      ).cornerRadius(10).p16().wFull(context),
    );
  }
}
