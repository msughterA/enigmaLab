import 'package:flutter/material.dart';
import 'dart:math';

class Palette {
  static const Color black = Color(0XFF222222);
  static const Color lighGray = Color(0XFFEBEBEB);
  static const Color darkGray = Color(0XFFCDCDCD);
  static const Color ligtBlue = Color(0XFF90C9E3);
  static const Color darkGreen = Color(0XFFACD0CD);
  static const Color white = Color(0XFFFFFFFF);
  static const Color yellow = Color(0XFFFFE10D);
}

class AppThemes {
  static ThemeData normalTheme = ThemeData(
    primaryColor: Palette.darkGreen,
    primarySwatch: generateMaterialColor(Palette.ligtBlue),
    fontFamily: 'Gilroy',
    scaffoldBackgroundColor: Palette.lighGray,
  );
}

MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(color.value, {
    50: tintColor(color, 0.9),
    100: tintColor(color, 0.8),
    200: tintColor(color, 0.6),
    300: tintColor(color, 0.4),
    400: tintColor(color, 0.2),
    500: color,
    600: shadeColor(color, 0.1),
    700: shadeColor(color, 0.2),
    800: shadeColor(color, 0.3),
    900: shadeColor(color, 0.4),
  });
}

int tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));

Color tintColor(Color color, double factor) => Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1);

int shadeValue(int value, double factor) =>
    max(0, min(value - (value * factor).round(), 255));

Color shadeColor(Color color, double factor) => Color.fromRGBO(
    shadeValue(color.red, factor),
    shadeValue(color.green, factor),
    shadeValue(color.blue, factor),
    1);
