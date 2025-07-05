import 'package:flutter/material.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';

class AddtionalInfo extends StatelessWidget {
  final String title;
  final String content;

  const AddtionalInfo({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (SizeConfig.screenWidth - SizeConfig.getScaleWidth(32)) / 3,
      child: Column(
          spacing: SizeConfig.getScaleHeight(4),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: SizeConfig.getScaleFontSize(14),
                  color: Color(0xFF9C9C9C)),
            ),
            Text(
              content,
              style: TextStyle(
                  fontSize: SizeConfig.getScaleFontSize(14),
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w500),
            ),
          ]),
    );
  }
}
