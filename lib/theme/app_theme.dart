import 'package:flutter/material.dart';
// show ThemeData, Color, Colors, AppBarTheme;

class AppTheme {
  static const Color primary = Colors.indigo;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    // ColorPrimario
    primaryColor: primary,
    // AppbarTheme
    appBarTheme: const AppBarTheme(color: primary, elevation: 0),
    // TextButtonTheme
  );
}
