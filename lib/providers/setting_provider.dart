import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  var lightMode = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blueGrey,
    dividerTheme: const DividerThemeData(thickness: 1),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    ),
  );

  var darkMode = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.cyan,
    dividerTheme: const DividerThemeData(thickness: 1),
    appBarTheme: const AppBarTheme(centerTitle: true),
  );

  bool _switchValue = false;
  bool get switchValue => _switchValue;
  set setSwitchValue(val) {
    _switchValue = val;
    notifyListeners();
  }
}
