import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    colorScheme: const ColorScheme(
      primary: Color.fromRGBO(0, 178, 255, 1),
      onPrimary: Colors.black,
      secondary: Color(0xFFEFF3F3),
      onSecondary: Color(0xFF322942),
      error: Colors.redAccent,
      onError: Colors.white,
      surface: Color(0xFFFAFBFB),
      onSurface: Color(0xFF241E30),
      brightness: Brightness.light,
    ),
    useMaterial3: true,
    appBarTheme: appBarTheme(),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Color(0XFF8B8B8B)),
    titleTextStyle: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
  );
}