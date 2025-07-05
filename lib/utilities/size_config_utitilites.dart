import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double scaleWidth;
  static late double scaleHeight;
  static late double paddingTopFromStatusBar;
  static const baseWidth = 375;
  static const baseHeight = 812;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    scaleWidth = screenWidth / baseWidth;
    scaleHeight = screenHeight / baseHeight;
    paddingTopFromStatusBar = _mediaQueryData.padding.top;
  }

  static double getScaleWidth(double value) {
    return value * scaleWidth;
  }

  static double getScaleHeight(double value) {
    return value * scaleHeight;
  }

  static double getScaleFontSize(double value) {
    return value * scaleWidth;
  }
}
