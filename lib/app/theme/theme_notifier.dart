import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  final String key = "theme";
  SharedPreferences _pref;
  bool _darkTheme;

  bool get isDarkTheme => _darkTheme;

  ThemeData get theme => isDarkTheme ? darkTheme : lightTheme;

  ThemeNotifier() {
    _darkTheme = false;
    _loadFromPrefs();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    if (_pref == null) _pref = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = _pref.getBool(key) ?? false;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _pref.setBool(key, _darkTheme);
  }
}

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
    shadowColor: Colors.white38);

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
