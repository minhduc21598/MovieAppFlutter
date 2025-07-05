import 'package:flutter/material.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';

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
            color: Color(0xFFDBE3FF)),
        child: Text(content.toUpperCase(),
            style: TextStyle(
                fontSize: SizeConfig.getScaleFontSize(10),
                fontWeight: FontWeight.bold,
                color: Color(0xFF88A4E8))));
  }
}
