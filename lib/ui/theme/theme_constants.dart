import 'package:flutter/material.dart';

const COLOR_PRIMARY = Color(0xff17bf41);
const COLOR_ACCENT = Color(0xffF25C05);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: COLOR_PRIMARY,
  appBarTheme: const AppBarTheme(color: COLOR_PRIMARY),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: COLOR_ACCENT),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: COLOR_PRIMARY,
  buttonTheme: const ButtonThemeData(
    buttonColor: COLOR_ACCENT,
  ),
  appBarTheme: const AppBarTheme(color: COLOR_PRIMARY),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: COLOR_ACCENT),
);
