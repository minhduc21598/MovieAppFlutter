import 'package:flutter/material.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/utilities/theme_utilities.dart';

class AddtionalInfo extends StatelessWidget {
  final String title;
  final String content;

  const AddtionalInfo({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (SizeConfig.screenWidth - SizeConfig.getScaleWidth(48)) / 3,
      child: Column(
          spacing: SizeConfig.getScaleHeight(4),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: SizeConfig.getScaleFontSize(14),
                color: ThemeUtilities.secondaryTextColor,
              ),
            ),
            Text(
              content,
              style: TextStyle(
                  fontSize: SizeConfig.getScaleFontSize(14),
                  color: ThemeUtilities.primaryTextColor,
                  fontWeight: FontWeight.w500),
            ),
          ]),
    );
  }
}
