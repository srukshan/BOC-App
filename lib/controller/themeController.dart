import 'package:flutter/material.dart';

class ThemeController{
  static ThemeData mainTheme = new ThemeData(
      primaryColor: Color(0xFFEE9944),
      primaryColorDark: Color(0xFFEE8833),
      primaryColorLight: Color(0xFFFFAA33),
      accentColor: Color(0xFF3F3F3F),
      primaryColorBrightness: Brightness.dark,
      accentColorBrightness: Brightness.light,
      textTheme: TextTheme(
        title: TextStyle(fontSize: 30),
        body1: TextStyle(fontSize: 15),
        body2: TextStyle(fontSize: 17),
      ),
      appBarTheme: AppBarTheme(
          textTheme: TextTheme(
              title: TextStyle(fontSize: 25),
              display2: TextStyle(fontSize: 50),
              button: TextStyle(fontSize: 15,color: Colors.white, fontWeight: FontWeight.normal)
          )
      ),
      primaryTextTheme: TextTheme(
          display1: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w300)
      )
  );
}