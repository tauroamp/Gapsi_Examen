import 'package:flutter/material.dart';

import 'constants.dart';

class AppThemeData {
  static const MaterialColor colorApp = MaterialColor(0xFF3F51B5, <int, Color>{
    50: Color(0xFFE8EAF6),
    100: Color(0xFFC5CBE9),
    200: Color(0xFF9FA8DA),
    300: Color(0xFF7985CB),
    400: Color(0xFF5C6BC0),
    500: Color(0xFF3F51B5),
    600: Color(0xFF394AAE),
    700: Color(0xFF3140A5),
    800: Color(0xFF29379D),
    900: Color(0xFF1B278D),
  });

  static const MaterialColor secundarColorApp =
      MaterialColor(0xFF5C6BC0, <int, Color>{});

  static const MaterialColor colorAccentApp =
      MaterialColor(0xFFFF1414, <int, Color>{
    100: Color(0xFFFF0E0E),
    200: Color(0xFFFF1414),
    400: Color(0xFFFF5B5B),
    700: Color(0xFFFF8A8A),
  });

  static ThemeData darkThemeData = ThemeData(
    //brightness: Brightness.dark,
    useMaterial3: true,
    primaryColor: colorApp,
    buttonTheme: ButtonThemeData(
      buttonColor: colorApp,
      textTheme: ButtonTextTheme.primary,
      padding: const EdgeInsets.all(kPaddingM),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kRadiusS),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      contentPadding: const EdgeInsets.all(kPaddingM),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: ThemeData.dark().dividerColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ThemeData.dark().dividerColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ThemeData.dark().dividerColor,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ThemeData.dark().dividerColor.withAlpha(10),
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: colorApp)
        .copyWith(secondary: colorAccentApp),
  );

  static ThemeData lightThemeData = ThemeData(
    // brightness: Brightness.light,
    useMaterial3: true,
    primaryColor: colorApp,
    // colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1B278D)),
    buttonTheme: ButtonThemeData(
      buttonColor: colorApp,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kRadiusS),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      contentPadding: const EdgeInsets.all(kPaddingM),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: ThemeData.light().dividerColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ThemeData.light().dividerColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ThemeData.light().dividerColor,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ThemeData.light().dividerColor.withAlpha(10),
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: colorApp)
        .copyWith(secondary: colorAccentApp),
  );
}
