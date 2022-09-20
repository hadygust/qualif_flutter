import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 91, 82, 113),
    colorScheme: const ColorScheme.dark(),
    primarySwatch: MaterialColor(0xFD297B, colorTin)
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    primarySwatch: MaterialColor(0xFD297B, colorTin)
  );

  ThemeData get getTheme => _selectedTheme;

  late ThemeData _selectedTheme;

  bool isDark() {
    return _selectedTheme == darkTheme ? true : false;
  }

  void swapTheme() {
    _selectedTheme = _selectedTheme == darkTheme ? lightTheme : darkTheme;
    notifyListeners();
  }

  ThemeProvider({required bool isDark}) {
    _selectedTheme = isDark ? darkTheme : lightTheme;
  }
}

 

const Map<int, Color> colorTin = {
  50: Color.fromARGB(0,253, 41, 123),
  100: Color.fromARGB(0,253, 41, 123),
  200: Color.fromARGB(0,253, 41, 123),
  300: Color.fromARGB(0,253, 41, 123),
  400: Color.fromARGB(0,255, 88, 100),
  500: Color.fromARGB(0,255, 88, 100),
  600: Color.fromARGB(0,255, 88, 100),
  700: Color.fromARGB(0,255, 101, 91),
  800: Color.fromARGB(0,255, 101, 91),
  900: Color.fromARGB(0,255, 101, 91),
};

const Map<int, Color> colorBlack = {
  50: Color.fromARGB(0, 0, 0, 0),
  100: Color.fromARGB(0, 0, 0, 0),
  200: Color.fromARGB(0, 0, 0, 0),
  300: Color.fromARGB(0, 0, 0, 0),
  400: Color.fromARGB(0, 0, 0, 0),
  500: Color.fromARGB(0, 0, 0, 0),
  600: Color.fromARGB(0, 0, 0, 0),
  700: Color.fromARGB(0, 0, 0, 0),
  800: Color.fromARGB(0, 0, 0, 0),
  900: Color.fromARGB(0, 0, 0, 0),
};
