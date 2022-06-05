import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar appbar() {
  return AppBar(
    elevation: 1,
    centerTitle: true,
    title: RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: 'Virtual',
            style: GoogleFonts.lora(
              fontWeight: FontWeight.w600,
              color: Colors.amber[600],
              fontSize: 25,
            ),
          ),
          TextSpan(
            text: ' Courier',
            style: GoogleFonts.lora(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ],
      ),
    ),
  );
}
