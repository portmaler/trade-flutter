import 'package:flutter/material.dart';
import 'package:trade_app1/main.dart';

class MyThemes {
  static const COLOR_PRIMARY = Colors.deepOrangeAccent;
  static const COLOR_ACCENT = Colors.orange;

  static const Color blackColor = Color(0x00000000);
  static const Color goldColor = Color(0xFFFFC23B);
  static const Color greyColor = Color(0xFFf1f2f6);
  static const Color whiteColor = Color(0xFFFFFFFF);

  static final lightThem = ThemeData(
    // colorScheme: ColorScheme.light(),
    scaffoldBackgroundColor: greyColor,
    primarySwatch: Colors.blue,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: COLOR_ACCENT),
    backgroundColor: greyColor,

    textTheme: const TextTheme(
      headline1: TextStyle(
          fontSize: 72.0, fontWeight: FontWeight.w600, color: goldColor),
      headline2: TextStyle(
          fontSize: 100.0, fontStyle: FontStyle.italic, color: blackColor),
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0))),
            backgroundColor: MaterialStateProperty.all<Color>(COLOR_ACCENT))),

    /*  inputDecorationTheme: InputDecorationTheme(
         
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Colors.grey.withOpacity(0.1))*/
  );

  static final darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    backgroundColor: MyApp.colors.blackcolor,
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.dark(),
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontSize: 72.0, fontWeight: FontWeight.w600, color: goldColor),
      headline2: TextStyle(
          fontSize: 36.0, fontStyle: FontStyle.italic, color: whiteColor),
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
  );
}
