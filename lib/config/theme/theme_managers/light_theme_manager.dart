import 'package:flutter/material.dart';
import 'package:spotlight/config/theme/theme_colors/theme_colors.dart';

ThemeData darkThemeManager = ThemeData(
  primaryColor: LightThemeColors.primaryColor,
  scaffoldBackgroundColor: LightThemeColors.scaffoldBackground,
  appBarTheme:const AppBarTheme(
    backgroundColor: LightThemeColors.scaffoldBackground
  ),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: LightThemeColors.primaryColor,
    onPrimary: LightThemeColors.onPrimary,
    secondary: LightThemeColors.secondaryColor,
    onSecondary: LightThemeColors.onSecondary,
    error: LightThemeColors.error,
    onError: LightThemeColors.onError,
    surface: LightThemeColors.surface,
    onSurface: LightThemeColors.onSurface,
  ),
);
