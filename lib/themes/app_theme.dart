import 'package:flutter/material.dart';

class AppTheme {
  // static const Color primaryApp = Colors.orange;
  static const Color primaryColorApp = Color.fromRGBO(0xEE, 0x1B, 0x24, 1);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    // Color primario
    primaryColor: primaryColorApp,
    //  AppBar Theme
    appBarTheme: const AppBarTheme(color: primaryColorApp, elevation: 0),
    // TextButtom Theme
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: primaryColorApp)),
    // FloatingActionButtoms
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColorApp, elevation: 5),
    // ElevateButtom
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: primaryColorApp,
            foregroundColor: Colors.white,
            shape: const StadiumBorder(),
            elevation: 0)),
    // InputDecorationTheme
    inputDecorationTheme: const InputDecorationTheme(
        floatingLabelStyle: TextStyle(color: primaryColorApp),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColorApp),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColorApp),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColorApp),
            borderRadius: BorderRadius.all(Radius.circular(10)))),

    //
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    // Color primario
    primaryColor: primaryColorApp,
    //  AppBar Theme
    appBarTheme: const AppBarTheme(color: primaryColorApp, elevation: 0),
    scaffoldBackgroundColor: Colors.black,
  );

  static final ThemeData rougeTheme = ThemeData.light().copyWith(
    // Color primario
    primaryColor: primaryColorApp,
    //  AppBar Theme
    appBarTheme: const AppBarTheme(color: primaryColorApp, elevation: 0),
    // TextButtom Theme
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: primaryColorApp)),
    // FloatingActionButtoms
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColorApp, elevation: 5),
    // ElevateButtom
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: primaryColorApp,
            foregroundColor: Colors.white,
            shape: const StadiumBorder(),
            elevation: 0)),
    // InputDecorationTheme
    inputDecorationTheme: const InputDecorationTheme(
        floatingLabelStyle: TextStyle(color: primaryColorApp),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColorApp),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColorApp),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColorApp),
            borderRadius: BorderRadius.all(Radius.circular(10)))),

    //
  );
}
