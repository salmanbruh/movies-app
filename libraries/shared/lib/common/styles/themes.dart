import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared/common/styles/color_palettes.dart';

TextTheme _textTheme = const TextTheme(
  headline1: TextStyle(
    fontSize: 92,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
  ),
  headline2: TextStyle(
    fontSize: 57,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
  ),
  headline3: TextStyle(
    fontSize: 46,
    fontWeight: FontWeight.w400,
  ),
  headline4: TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  headline5: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
  ),
  headline6: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  ),
  subtitle1: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  ),
  subtitle2: TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  ),
  bodyText1: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  ),
  bodyText2: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  button: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
  ),
  caption: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  ),
  overline: TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  ),
).apply(bodyColor: Colors.white);

ThemeData theme = ThemeData(
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: Modular.get<ColorPalettes>().darkPrimary,
    secondary: Modular.get<ColorPalettes>().darkPrimary.withOpacity(.25),
    background: Modular.get<ColorPalettes>().darkBG,
    brightness: Brightness.dark,
  ),
  backgroundColor: Modular.get<ColorPalettes>().darkBG,
  dialogBackgroundColor: Modular.get<ColorPalettes>().darkBG,
  scaffoldBackgroundColor: Modular.get<ColorPalettes>().darkBG,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(
      color: Modular.get<ColorPalettes>().lightPrimary,
    ),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 18,
    ),
  ),
  textTheme: _textTheme,
  buttonTheme: ButtonThemeData(
    buttonColor: Modular.get<ColorPalettes>().darkAccent,
    textTheme: ButtonTextTheme.primary,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
  ),
);
