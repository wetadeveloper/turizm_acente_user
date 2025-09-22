import 'package:flutter/material.dart';
import 'package:selamet/core/theme/constant.dart';

class LightTheme {
  ThemeData get lightThemeData => ThemeData.light().copyWith(
        primaryColor: LightThemeColors.primaryColor,
        appBarTheme: const AppBarTheme(
          color: LightThemeColors.appBarColor,
          titleTextStyle: TextStyle(
            color: LightThemeColors.titleColor,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: LightThemeColors.titleColor,
          ),
          actionsIconTheme: IconThemeData(
            color: LightThemeColors.titleColor,
          ),
          toolbarTextStyle: TextStyle(
            color: LightThemeColors.titleColor,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: LightThemeColors.selectedItemColor,
          unselectedItemColor: LightThemeColors.unselectedItemColor,
          backgroundColor: Colors.white,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: LightThemeColors.floatingActionButtonColor,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              fontSize: 72.0, fontWeight: FontWeight.bold, fontFamily: 'Roboto', color: LightThemeColors.textColor),
          displayMedium: TextStyle(
              fontSize: 60.0, fontWeight: FontWeight.bold, fontFamily: 'Roboto', color: LightThemeColors.textColor),
          displaySmall: TextStyle(
              fontSize: 48.0, fontWeight: FontWeight.bold, fontFamily: 'Roboto', color: LightThemeColors.textColor),
          headlineLarge: TextStyle(
              fontSize: 40.0, fontWeight: FontWeight.bold, fontFamily: 'Roboto', color: LightThemeColors.textColor),
          headlineMedium: TextStyle(
              fontSize: 34.0, fontWeight: FontWeight.bold, fontFamily: 'Roboto', color: LightThemeColors.textColor),
          headlineSmall: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.bold, fontFamily: 'Roboto', color: LightThemeColors.textColor),
          titleLarge: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'Roboto', color: LightThemeColors.titleColor),
          titleMedium: TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.bold, fontFamily: 'Roboto', color: LightThemeColors.titleColor),
          titleSmall: TextStyle(
              fontSize: 14.0, fontWeight: FontWeight.bold, fontFamily: 'Roboto', color: LightThemeColors.titleColor),
          bodyLarge: TextStyle(
              fontSize: 22.0, fontFamily: 'Roboto', fontWeight: FontWeight.bold, color: LightThemeColors.textColor),
          bodyMedium: TextStyle(
              fontSize: 18.0, fontFamily: 'Roboto', fontWeight: FontWeight.bold, color: LightThemeColors.textColor),
          bodySmall: TextStyle(
              fontSize: 14.0, fontFamily: 'Roboto', fontWeight: FontWeight.bold, color: LightThemeColors.textColor),
          labelLarge: TextStyle(
              fontSize: 14.0, fontWeight: FontWeight.bold, fontFamily: 'Roboto', color: LightThemeColors.textColor),
          labelMedium: TextStyle(
              fontSize: 12.0, fontFamily: 'Roboto', fontWeight: FontWeight.bold, color: LightThemeColors.textColor),
          labelSmall: TextStyle(
              fontSize: 11.0, fontFamily: 'Roboto', fontWeight: FontWeight.bold, color: LightThemeColors.textColor),
        ),
      );
}
