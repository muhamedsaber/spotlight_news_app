import 'package:flutter/material.dart';
import 'package:spotlight/config/theme/theme_colors/theme_colors.dart';

ThemeData lightThemeManager = ThemeData(
  primaryColor: DarkThemeColors.primaryColor,
  appBarTheme:const AppBarTheme(
    backgroundColor: DarkThemeColors.scaffoldBackground
  ),
  scaffoldBackgroundColor: DarkThemeColors.scaffoldBackground,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: DarkThemeColors.primaryColor,
    onPrimary: DarkThemeColors.onPrimary,
    secondary: DarkThemeColors.secondaryColor,
    onSecondary: DarkThemeColors.onSecondary,
    error: DarkThemeColors.error,
    onError: DarkThemeColors.onError,
    surface: DarkThemeColors.surface,
    onSurface: DarkThemeColors.onSurface,
  ),
);
