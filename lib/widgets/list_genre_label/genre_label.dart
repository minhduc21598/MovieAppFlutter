import 'package:flutter/material.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/utilities/theme_utilities.dart';

class GenreLabel extends StatelessWidget {
  final String content;
  const GenreLabel({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            vertical: SizeConfig.getScaleHeight(4),
            horizontal: SizeConfig.getScaleWidth(12)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConfig.getScaleWidth(100)),
            shape: BoxShape.rectangle,
            color: ThemeUtilities.genreBackground),
        child: Text(content.toUpperCase(),
            style: TextStyle(
                fontSize: SizeConfig.getScaleFontSize(10),
                fontWeight: FontWeight.bold,
                color: ThemeUtilities.genreTitle)));
  }
}
