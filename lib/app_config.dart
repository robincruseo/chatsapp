import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConfig {
  static const String appName = "هُتاف";
  static const String appIcon = "assets/images/ic_launcher.png";
  static const String appFont = "";
  static const int appVersion = 0;
  static const Color appColor = Color(0xFF6CA748);
  static const Color appText = Color(0xFF657C78);
//  static const Color appColor = Color(0xFF657C78);
  static const Color appColor2 = Color(0xFFfdeabf);
  static const Color appColor1 = Color(0xFFf6c2d9);
  static const bool isProduction = false;
//  final c= Colors.transparent;

  static TextStyle textStyle({double size, FontWeight weight, Color color}) =>
      GoogleFonts.pacifico(
        fontWeight: weight,
        fontSize: size,
        color: color,
      );
//      app.textStyle(weight == FontWeight.bold, size, color);
}
