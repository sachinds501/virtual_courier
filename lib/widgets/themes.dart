import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.montserrat().fontFamily,
      cardColor: Colors.white,
      canvasColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        toolbarTextStyle: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ).bodyText2,
        titleTextStyle: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ).headline6,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color.fromARGB(255, 255, 213, 33),
          primary: Colors.grey[400]));

  //Colors
  static Color creamColor = const Color(0xfff5f5f5);
  static Color lightBluishColor = Vx.indigo500;
  static Color cyberYellowColor = const Color.fromARGB(255, 255, 213, 33);
}
