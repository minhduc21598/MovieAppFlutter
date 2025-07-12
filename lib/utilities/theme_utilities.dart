import 'package:flutter/material.dart';
import 'package:movie_world/constants/color_value.dart';
import 'package:movie_world/constants/theme_mode_key.dart';

class ThemeUtilities {
  static ThemeMode createThemeMode(String mode) =>
      mode == ThemeModeKey.dark ? ThemeMode.dark : ThemeMode.light;

  static ThemeMode themeMode = ThemeMode.light;
  static bool get isDarkMode => themeMode == ThemeMode.dark;

  static Color get scaffoldBackground =>
      isDarkMode ? ColorValue.darkBackground : ColorValue.lightBackground;
  static Color get appBarBackground =>
      isDarkMode ? ColorValue.darkBackground : ColorValue.lightBackground;
  static Color get appBarForeground =>
      isDarkMode ? ColorValue.darkPrimaryText : ColorValue.lightPrimaryText;
  static Color get iconColor =>
      isDarkMode ? ColorValue.darkIcon : ColorValue.lightIcon;
  static Color get primaryTextColor =>
      isDarkMode ? ColorValue.darkPrimaryText : ColorValue.lightPrimaryText;
  static Color get secondaryTextColor =>
      isDarkMode ? ColorValue.darkSecondaryText : ColorValue.lightSecondaryText;
  static Color get genreTitle =>
      isDarkMode ? ColorValue.darkGenreTitle : ColorValue.lightGenreTitle;
  static Color get genreBackground => isDarkMode
      ? ColorValue.darkGenreBackground
      : ColorValue.lightGenreBackground;
  static Color get imagePlaceholderBackground => isDarkMode
      ? ColorValue.darkGenreBackground
      : ColorValue.lightGenreBackground;
  static Color get shimmerColor1 =>
      isDarkMode ? ColorValue.darkShimmerColor1 : ColorValue.lightShimmerColor1;
  static Color get shimmerColor2 =>
      isDarkMode ? ColorValue.darkShimmerColor2 : ColorValue.lightShimmerColor2;
  static Color get textFieldBackground => isDarkMode
      ? ColorValue.darkTextFieldBackground
      : ColorValue.lightTextFieldBackground;

  static AppBarTheme createAppBarTheme() {
    return AppBarTheme(
        backgroundColor: appBarBackground,
        foregroundColor: appBarForeground,
        titleTextStyle: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: appBarForeground),
        iconTheme: IconThemeData(color: appBarForeground));
  }

  static ThemeData createTheme(Brightness brightness) {
    return ThemeData(
      brightness: brightness,
      scaffoldBackgroundColor: scaffoldBackground,
      appBarTheme: createAppBarTheme(),
    );
  }
}
