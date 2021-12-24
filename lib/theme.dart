import 'package:dormamu/src/utils/bed_input_border.dart';
import 'package:dormamu/src/utils/decoration/bed_shape.dart';
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
    cardTheme: _cardTheme,
    inputDecorationTheme: _inputDecorationTheme,
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

CardTheme get _cardTheme {
  return const CardTheme(
    shape: BedShape(),
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

InputDecorationTheme get _inputDecorationTheme {
  return const InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFFBBBBBB),
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(25)),
      ),
      helperStyle: TextStyle(
        color: primaryColor,
      ),
      focusedBorder: BedInputBorder(
        borderSide: BorderSide(
          color: primaryColor,
          width: 2,
        ),
      ));
}
