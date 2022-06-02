import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tractoapp/ui/styles/palette.dart';

import '../../core/constanst/ui_constans.dart';

class CustomTheme {
  final String data = 'CustomTheme data';

  static const primaryColor = Palette.tractoGreen;
  static const secondaryColor = Palette.tractoGreen;
  static const yellowColor = Palette.yellow;
  static const mainFontSize = 20.0;

  static const textTheme = TextTheme(
    button: TextStyle(color: Palette.white),
    //TextStyles for headlines

    //Headline 6 used for textbuttons and custombuttons with fontsize 17 and bold fontweight
    headline6: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Palette.black),

    //Headline 5 used for text with fontsize 18 and regular fontweight
    headline5: TextStyle(fontSize: 18, color: Palette.black),

    //Headline 4 used for numbers and amount  with fontsize 18 and bold fontweight
    headline4: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Palette.tractoRed),

    //Headline 3 used for numbers and amount  with fontsize 18 and bold fontweight
    headline3: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Palette.black),

    //Headline 2 used for titles and subtitles with fontsize 20 and bold fontweight
    headline2: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Palette.tractoViolet),

    //Headline 1 used for AppBar(Header) with fontsize 22 and bold fontweight
    headline1: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Palette.white),
    bodyText2: TextStyle(fontSize: 18, color: Palette.black),
  );

  static ThemeData lightTheme() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      shadowColor: Palette.shadowColor,
      scaffoldBackgroundColor: Palette.tractobackgroundColor,
      brightness: Brightness.light,
      primaryColor: primaryColor,
      focusColor: secondaryColor,
      appBarTheme: AppBarTheme(
        color: primaryColor,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        titleTextStyle: GoogleFonts.quicksandTextTheme(textTheme).headline1,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(GoogleFonts.quicksandTextTheme(textTheme).headline6),
          backgroundColor: MaterialStateProperty.all(Palette.green),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(UIConstants.borderRadius)),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(GoogleFonts.quicksandTextTheme(textTheme).headline6),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(GoogleFonts.quicksandTextTheme(textTheme).headline6),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(UIConstants.borderRadius),
              side: const BorderSide(color: Palette.green, width: 5),
            ),
          ),
        ),
      ),
      textTheme: GoogleFonts.quicksandTextTheme(textTheme),
      buttonTheme: ButtonThemeData(
        buttonColor: secondaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        textTheme: ButtonTextTheme.accent,
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.resolveWith((states) {
          return Palette.white;
        }),
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return Palette.white;
          } else if (states.contains(MaterialState.error)) {
            return Palette.red;
          } else if (states.contains(MaterialState.error)) {
            return Palette.red;
          } else {
            return secondaryColor;
          }
        }),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: secondaryColor,
        focusColor: secondaryColor,
        hoverColor: secondaryColor,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Palette.grey),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        labelStyle: TextStyle(color: Palette.black54),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: secondaryColor, width: 1.8),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal)
          .copyWith(primary: secondaryColor, secondary: secondaryColor),
    );
  }
}
