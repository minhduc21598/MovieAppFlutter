import 'package:flutter/material.dart';
import 'package:movie_world/gen/strings.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/utilities/theme_utilities.dart';

class LoadingFooter extends StatelessWidget {
  const LoadingFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final Strings strings = Strings.of(context)!;

    return Container(
      width: SizeConfig.screenWidth,
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(
          vertical: SizeConfig.getScaleHeight(12), horizontal: 0),
      child: Row(
        spacing: SizeConfig.getScaleWidth(12),
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: SizeConfig.getScaleWidth(18),
            height: SizeConfig.getScaleWidth(18),
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 1.5,
                color: ThemeUtilities.primaryTextColor,
              ),
            ),
          ),
          Text(
            strings.loading,
            style: TextStyle(
                fontSize: SizeConfig.getScaleFontSize(12),
                color: ThemeUtilities.primaryTextColor),
          )
        ],
      ),
    );
  }
}
