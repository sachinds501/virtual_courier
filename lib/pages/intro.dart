import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:virtual_courier/utils/routes.dart';

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  static List<Widget> kIcons = <Widget>[
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/intro1.png'),
        const SizedBox(
          height: 20,
        ),
        "Easy pickup & Delivery".text.xl2.black.bold.make(),
        const SizedBox(
          height: 20,
        ),
        "On-demand pickup is available along with\nasy delivery powered by Akshaak to\navoid any hassle"
            .text
            .gray400
            .center
            .maxFontSize(12)
            .make(),
        const SizedBox(
          height: 20,
        ),
      ],
    ).p24(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/intro2.png'),
        const SizedBox(
          height: 20,
        ),
        "Easy pickup & Delivery".text.xl2.black.bold.make(),
        const SizedBox(
          height: 20,
        ),
        "On-demand pickup is available along with\nasy delivery powered by Akshaak to\navoid any hassle"
            .text
            .gray400
            .center
            .maxFontSize(12)
            .make(),
        const SizedBox(
          height: 20,
        ),
      ],
    ).p24(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/intro3.png'),
        const SizedBox(
          height: 20,
        ),
        "Easy pickup & Delivery".text.xl2.black.bold.make(),
        const SizedBox(
          height: 20,
        ),
        "On-demand pickup is available along with\nasy delivery powered by Akshaak to\navoid any hassle"
            .text
            .gray400
            .center
            .maxFontSize(12)
            .make(),
        const SizedBox(
          height: 20,
        ),
      ],
    ).p24(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: <Widget>[
          SizedBox(
            height: 20,
            width: 70,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.loginRoute);
              },
              child: "Skip".text.bold.black.xl.make(),
            ),
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: kIcons.length,
          // Use a Builder here, otherwise `DefaultTabController.of(context)` below
          // returns null.
          child: Builder(
            builder: (BuildContext context) => SafeArea(
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: IconTheme(
                    data: IconThemeData(
                      size: 18.0,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: TabBarView(children: kIcons),
                  )),
                  Stack(
                    children: <Widget>[
                      const SizedBox(
                        height: 85,
                        width: 85,
                        child: CircularProgressIndicator(value: 3),
                      ),
                      IconButton(
                        onPressed: () {
                          final TabController controller =
                              DefaultTabController.of(context)!;
                          if (controller.index + 1 != kIcons.length) {
                            controller.animateTo(controller.index + 1);
                          }
                        },
                        icon: Icon(
                          Icons.arrow_circle_right_rounded,
                          size: 70,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ).pOnly(bottom: 60),
                    ], //<Widget>[]
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
