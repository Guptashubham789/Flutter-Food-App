import 'package:flutter/material.dart';

ThemeData themeData=ThemeData(


  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        primary: Colors.red,
        side: const BorderSide(
            color: Colors.red,
            width: 1.1
        )
    ),
  )
);