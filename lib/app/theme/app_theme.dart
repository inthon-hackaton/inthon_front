import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kPrimaryColor = Color(0xffffa3ac);
const kSecondaryColor = Color(0xffaa3c52);

final w100 = GoogleFonts.gothicA1(fontWeight: FontWeight.w100).fontFamily;
final w200 = GoogleFonts.gothicA1(fontWeight: FontWeight.w200).fontFamily;
final w300 = GoogleFonts.gothicA1(fontWeight: FontWeight.w300).fontFamily;
final w400 = GoogleFonts.gothicA1(fontWeight: FontWeight.w400).fontFamily;
final w500 = GoogleFonts.gothicA1(fontWeight: FontWeight.w500).fontFamily;
final w600 = GoogleFonts.gothicA1(fontWeight: FontWeight.w600).fontFamily;
final w700 = GoogleFonts.gothicA1(fontWeight: FontWeight.w700).fontFamily;
final w800 = GoogleFonts.gothicA1(fontWeight: FontWeight.w800).fontFamily;
final w900 = GoogleFonts.gothicA1(fontWeight: FontWeight.w900).fontFamily;

final h1 = TextStyle(fontSize: 24, fontFamily: w700, letterSpacing: -0.48);
TextStyle h1c(Color color) => h1.copyWith(color: color);

final h2 = TextStyle(fontSize: 20, fontFamily: w700, letterSpacing: -0.40);
TextStyle h2c(Color color) => h2.copyWith(color: color);

final h3 = TextStyle(fontSize: 18, fontFamily: w600, letterSpacing: -0.36);
TextStyle h3c(Color color) => h3.copyWith(color: color);

final h4 = TextStyle(fontSize: 16, fontFamily: w500, letterSpacing: -0.32);
TextStyle h4c(Color color) => h4.copyWith(color: color);

final h5 = TextStyle(fontSize: 14, fontFamily: w500, letterSpacing: -0.28);
TextStyle h5c(Color color) => h5.copyWith(color: color);

const body1 = TextStyle(fontSize: 16);
TextStyle body1c(Color color) => body1.copyWith(color: color);

const body2 = TextStyle(fontSize: 14);
TextStyle body2c(Color color) => body2.copyWith(color: color);

const body3 = TextStyle(fontSize: 12);
TextStyle body3c(Color color) => body3.copyWith(color: color);

final caption = TextStyle(fontSize: 12, fontFamily: w400);

TextStyle captionc(Color color) => caption.copyWith(color: color);

final ThemeData kAppThemeData = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: kPrimaryColor,
  ),
  useMaterial3: true,
  textTheme: GoogleFonts.gothicA1TextTheme(),
);
