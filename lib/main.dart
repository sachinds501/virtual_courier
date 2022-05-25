import 'package:flutter/material.dart';
import 'package:virtual_courier/pages/intro.dart';
import 'package:virtual_courier/pages/loginpage.dart';
import 'package:virtual_courier/pages/splashscreen.dart';
import 'package:virtual_courier/utils/routes.dart';
import 'package:virtual_courier/widgets/themes.dart';

void main() {
  runApp(const MyApp());
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
      initialRoute: MyRoutes.splashscreenRoute,
      routes: {
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.splashscreenRoute: (context) => const AfterSplash(),
        MyRoutes.introRoute: (context) => const Intro()
      },
    );
  }
}
