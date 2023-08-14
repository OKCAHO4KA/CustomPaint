import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  ThemeData _currentTheme = ThemeData.light();

  ThemeChanger(int theme) {
    switch (theme) {
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light().copyWith(indicatorColor: Colors.teal);
        break;

      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark().copyWith(indicatorColor: Colors.pink);
        break;

      case 3:
        _darkTheme = false;
        _customTheme = true;
        _currentTheme = ThemeData.light();
        break;

      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
    }
  }

  bool get darkTheme => _darkTheme;
  bool get customTheme => _customTheme;
  ThemeData get currentTheme => _currentTheme;
  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;

    if (value) {
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme = ThemeData.light().copyWith(indicatorColor: Colors.teal);
    }
    notifyListeners();
  }

  set customTheme(bool value) {
    _darkTheme = false;
    _customTheme = value;

    if (value) {
      _currentTheme = ThemeData.light().copyWith(
        indicatorColor: const Color(0xff48A0EB),
        primaryColorLight: Colors.white,
        hoverColor: Colors.grey,
        scaffoldBackgroundColor: const Color(0xff16202b),
        textTheme: const TextTheme(
            bodyMedium: TextStyle(
                fontSize: 14,
                color: Colors.black45,
                fontWeight: FontWeight.w300)),
      );
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }
}
