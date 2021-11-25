import 'package:flutter/material.dart';

//Colors
const Color primaryColor = Color(0xFF8109C2);
const Color secondaryColor = Color(0xFF63C3D5);

const Color selectedItemColor = Colors.white;
const Color unselectedItemColor = Color(0xFFAAAAAA);

ThemeData get dormamuTheme {
  return ThemeData(
    colorScheme: _colorScheme,
    bottomNavigationBarTheme: _bottomNavigationBarTheme,
    navigationRailTheme: _navigationRailTheme,
  );
}

ColorScheme get _colorScheme {
  //TODO: use ColorScheme();
  return ThemeData().colorScheme.copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
  );
}

BottomNavigationBarThemeData get _bottomNavigationBarTheme {
  return const BottomNavigationBarThemeData(
    backgroundColor: primaryColor,
    selectedItemColor: selectedItemColor,
    unselectedItemColor: unselectedItemColor,
  );
}

NavigationRailThemeData get _navigationRailTheme {
  return const NavigationRailThemeData(
    backgroundColor: primaryColor,
    selectedIconTheme: IconThemeData(color: selectedItemColor),
    selectedLabelTextStyle: TextStyle(color: selectedItemColor),
    unselectedIconTheme: IconThemeData(color: unselectedItemColor),
    unselectedLabelTextStyle: TextStyle(color: unselectedItemColor),
  );
}