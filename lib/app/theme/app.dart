import 'package:app_adove/app/global/helpers/constraints.dart';
import 'package:flutter/material.dart';

final ThemeData appThemeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primarySwatch: Colors.deepOrange,
  primaryColor: Colors.deepPurpleAccent,
  fontFamily: 'Myriad',
  dividerColor: Colors.transparent,

  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      color: Colors.black,
      fontSize: kH2,
      fontFamily: 'Myriad',
      fontWeight: FontWeight.normal,
    ),
    hintStyle: TextStyle(
      color: Colors.grey,
      fontSize: kH2,
      fontFamily: 'Myriad',
      fontWeight: FontWeight.normal,
    ),
  ),
);