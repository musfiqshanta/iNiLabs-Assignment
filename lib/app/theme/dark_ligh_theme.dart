import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ini_labs/app/theme/text_theme.dart';

ThemeData darkTheme = ThemeData(
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.black,
    ),
    focusColor: Colors.black,
    textTheme: textTheme,
    primaryColor: Colors.black,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
    )),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 30,
        )));

ThemeData lightTheme = ThemeData(
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.amber,
    ),
    focusColor: Colors.amber,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: Colors.amber,
    )),
    textTheme: textTheme,
    primaryColor: Colors.amber,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.amber,
    ));
