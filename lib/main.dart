import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:virtual_courier/pages/choosemedium.dart';
import 'package:virtual_courier/pages/drawer_pages/profile/edit_profile.dart';
import 'package:virtual_courier/pages/intro.dart';
import 'package:virtual_courier/pages/map/homemappage.dart';
import 'package:virtual_courier/pages/loginpage/loginpage.dart';
import 'package:virtual_courier/pages/loginpage/materialsegmentcontrol.dart';
import 'package:virtual_courier/pages/loginpage/signuppage.dart';
import 'package:virtual_courier/pages/drawer_pages/help.dart';
import 'package:virtual_courier/pages/drawer_pages/order.dart';
import 'package:virtual_courier/pages/drawer_pages/payment.dart';
import 'package:virtual_courier/pages/drawer_pages/promocode.dart';
import 'package:virtual_courier/pages/drawer_pages/profile/view_profile.dart';
import 'package:virtual_courier/pages/whattosend.dart/whatareyousending.dart';
import 'package:virtual_courier/pages/splashscreen.dart';
import 'package:virtual_courier/utils/routes.dart';
import 'package:virtual_courier/widgets/themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('es', ''), // Spanish, no country code
      ],
      title: 'Flutter Demo',
      theme: MyTheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.splashscreenRoute,
      routes: {
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.splashscreenRoute: (context) => const AfterSplash(),
        MyRoutes.introRoute: (context) => const Intro(),
        MyRoutes.signupRoute: (context) => const SignUp(),
        MyRoutes.materialsegmentRoute: (context) => const MaterialSegment(),
        MyRoutes.homemappageroute: (context) => const HomeMapPage(),
        // MyRoutes.panelroute: (context) => const PanelPage(),
        MyRoutes.whattosendroute: (context) => const WhatToSend(),
        MyRoutes.choosemediumroute: (context) => const ChooseMedium(),
        MyRoutes.helppageroute: (context) => const Help(),
        MyRoutes.orderpageroute: (context) => const OrderPage(),
        MyRoutes.viewprofileroute: (context) => const ViewProfilePage(),
        MyRoutes.editprofileroute: (context) => const EditProfilePage(),
        MyRoutes.paymentpageroute: (context) => const PaymentPage(),
        MyRoutes.promcodepageroute: (context) => const PromocodePage(),
      },
    );
  }
}
