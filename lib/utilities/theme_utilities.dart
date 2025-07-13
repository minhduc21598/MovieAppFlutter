import 'package:flutter/material.dart';
import 'package:movie_world/constants/color_theme.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';

class ThemeUtilities {
  static ThemeMode themeMode = ThemeMode.light;
  static bool get isDarkMode => themeMode == ThemeMode.dark;

  static Color get scaffoldBackground =>
      isDarkMode ? ColorTheme.darkBackground : ColorTheme.lightBackground;
  static Color get appBarBackground =>
      isDarkMode ? ColorTheme.darkBackground : ColorTheme.lightBackground;
  static Color get appBarForeground =>
      isDarkMode ? ColorTheme.darkPrimaryText : ColorTheme.lightPrimaryText;
  static Color get iconColor =>
      isDarkMode ? ColorTheme.darkIcon : ColorTheme.lightIcon;
  static Color get primaryTextColor =>
      isDarkMode ? ColorTheme.darkPrimaryText : ColorTheme.lightPrimaryText;
  static Color get secondaryTextColor =>
      isDarkMode ? ColorTheme.darkSecondaryText : ColorTheme.lightSecondaryText;
  static Color get genreTitle =>
      isDarkMode ? ColorTheme.darkGenreTitle : ColorTheme.lightGenreTitle;
  static Color get genreBackground => isDarkMode
      ? ColorTheme.darkGenreBackground
      : ColorTheme.lightGenreBackground;
  static Color get shimmerColor1 =>
      isDarkMode ? ColorTheme.darkShimmerColor1 : ColorTheme.lightShimmerColor1;
  static Color get shimmerColor2 =>
      isDarkMode ? ColorTheme.darkShimmerColor2 : ColorTheme.lightShimmerColor2;
  static Color get textFieldBackground => isDarkMode
      ? ColorTheme.darkTextFieldBackground
      : ColorTheme.lightTextFieldBackground;
  static Color get borderColor =>
      isDarkMode ? ColorTheme.borderColor : ColorTheme.borderColor;
  static Color get imagePlaceholderBackground => isDarkMode
      ? ColorTheme.imagePlaceholderBackground
      : ColorTheme.imagePlaceholderBackground;
  static Color get floatButtonBackground => isDarkMode
      ? ColorTheme.floatButtonBackground
      : ColorTheme.floatButtonBackground;

  static void createThemeMode(ThemeMode mode) {
    themeMode = mode;
  }

  static AppBarTheme createAppBarTheme() {
    return AppBarTheme(
        backgroundColor: appBarBackground,
        foregroundColor: appBarForeground,
        titleTextStyle: TextStyle(
            fontSize: SizeConfig.getScaleFontSize(16),
            fontWeight: FontWeight.bold,
            color: appBarForeground),
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
