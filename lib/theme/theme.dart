import 'package:flutter/material.dart';
const Color bluishColor = Color(0xFF4e5ae8);
const Color yellowColor = Color(0xFFFFB746);
const Color pinkColor = Color(0xFFff4667);
const Color whiteColor = Colors.white;
const primaryColor = bluishColor;
const Color darkGreyColor = Color(0xFF121212);
Color darkHeaderColor = const Color(0xFF424242);
class Themes {

  static final lightTheme = ThemeData(
    primaryColor: primaryColor,
    brightness: Brightness.light,

  );

  static final darkTheme = ThemeData(
    primaryColor: pinkColor,
    brightness: Brightness.dark,

  );
}