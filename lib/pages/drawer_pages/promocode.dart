import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class PromocodePage extends StatefulWidget {
  const PromocodePage({Key? key}) : super(key: key);

  @override
  State<PromocodePage> createState() => _PromocodePageState();
}

class _PromocodePageState extends State<PromocodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: "PromocodePage".text.xl3.make(),
    ));
  }
}
