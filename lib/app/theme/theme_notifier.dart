import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData;

  ThemeNotifier(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData themeData) async {
    _themeData = themeData;
    notifyListeners();
  }
}

// final darkTheme = ThemeData(
//   primarySwatch: Colors.grey,
//   primaryColor: Colors.black,
//   brightness: Brightness.dark,
//   backgroundColor: const Color(0xFF212121),
//   accentColor: Colors.white,
//   accentIconTheme: IconThemeData(color: Colors.black),
//   dividerColor: Colors.black12,
// );
final darkTheme = ThemeData(
  textTheme: TextTheme(
    headline2: TextStyle(
        fontSize: 20.0, color: Colors.white54, fontWeight: FontWeight.w800),
    bodyText1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Color.fromRGBO(255, 255, 255, 0.87),
    ),
    bodyText2: TextStyle(
        color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 21),
    subtitle1: TextStyle(
        fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white54),
  ),
  accentColor: Colors.white54,
  appBarTheme: AppBarTheme(color: Colors.black87),
  scaffoldBackgroundColor: Colors.grey[800],
  cardColor: Colors.grey[900],
  brightness: Brightness.dark,
  shadowColor: Colors.white38
);

final lightTheme = ThemeData(
  textTheme: TextTheme(
    headline2: TextStyle(
        fontSize: 20.0, color: Colors.black54, fontWeight: FontWeight.w800),
    bodyText1: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
    bodyText2: TextStyle(
        color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 21),
    subtitle1: TextStyle(
        fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black54),
  ),
  accentColor: Colors.black87,
  appBarTheme: AppBarTheme(color: Colors.black54),
  scaffoldBackgroundColor: Color.fromRGBO(255, 255, 255, 0.9),
  brightness: Brightness.light,
);
