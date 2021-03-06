import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeState extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance!.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class SystemThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.black,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.indigo))),
    colorScheme: ColorScheme.dark(),
    iconTheme: IconThemeData(color: Colors.indigo, opacity: 0.8),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue))),
    colorScheme: ColorScheme.light(),
    iconTheme: IconThemeData(color: Colors.blue, opacity: 0.8),
  );
}

class DynamicColors {
  static Color getWhite70Black87(bool isDarkMode) {
    if (isDarkMode)
      return Colors.white70;
    else
      return Colors.black87;
  }

  static Color getWhite24Black38(bool isDarkMode) {
    if (isDarkMode)
      return Colors.white24;
    else
      return Colors.black38;
  }
}
