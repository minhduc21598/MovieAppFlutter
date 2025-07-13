import 'package:flutter/material.dart';
import 'package:movie_world/utilities/theme_utilities.dart';

class MainController extends ChangeNotifier {
  bool isLoading = false;

  static final MainController _singleton = MainController._internal();

  factory MainController() {
    return _singleton;
  }

  MainController._internal();

  void saveThemeMode(ThemeMode themeMode) {
    isLoading = true;
    notifyListeners();
    ThemeUtilities.themeMode = themeMode;
    isLoading = false;
    notifyListeners();
  }
}
