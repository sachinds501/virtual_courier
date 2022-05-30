import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:virtual_courier/pages/intro.dart';
import 'package:virtual_courier/pages/homemappage.dart';
import 'package:virtual_courier/pages/loginpage/loginpage.dart';
import 'package:virtual_courier/pages/loginpage/materialsegmentcontrol.dart';
import 'package:virtual_courier/pages/panel.dart';
import 'package:virtual_courier/pages/loginpage/signuppage.dart';
import 'package:virtual_courier/pages/whattosend.dart/whatareyousending.dart';
import 'package:virtual_courier/pages/splashscreen.dart';
import 'package:virtual_courier/utils/routes.dart';
import 'package:virtual_courier/widgets/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyTheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.loginRoute,
      routes: {
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.splashscreenRoute: (context) => const AfterSplash(),
        MyRoutes.introRoute: (context) => const Intro(),
        MyRoutes.signupRoute: (context) => const SignUp(),
        MyRoutes.materialsegmentRoute: (context) => const MaterialSegment(),
        MyRoutes.homemappageroute: (context) => const HomeMapPage(),
        MyRoutes.panelroute: (context) => const PanelPage(),
        MyRoutes.whattosendroute: (context) => const WhatToSend(),
      },
    );
  }
}
