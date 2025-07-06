import 'package:flutter/material.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';

class SuggestKeywordItem extends StatelessWidget {
  final Function onPressKeyword;
  final String content;
  const SuggestKeywordItem(
      {super.key, required this.onPressKeyword, required this.content});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressKeyword();
      },
      child: Container(
        width: SizeConfig.screenWidth,
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.getScaleWidth(16),
            vertical: SizeConfig.getScaleHeight(8)),
        child: Text(
          content,
          style: TextStyle(
              fontSize: SizeConfig.getScaleFontSize(14), color: Colors.black),
        ),
      ),
    );
  }
}
