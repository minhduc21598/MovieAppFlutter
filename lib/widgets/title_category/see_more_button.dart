import 'package:flutter/material.dart';
import 'package:movie_world/gen/strings.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/utilities/theme_utilities.dart';

class SeeMoreButton extends StatelessWidget {
  final Function onSeeMore;
  const SeeMoreButton({super.key, required this.onSeeMore});

  @override
  Widget build(BuildContext context) {
    final Strings strings = Strings.of(context)!;

    return GestureDetector(
      onTap: () {
        onSeeMore();
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(
            SizeConfig.getScaleWidth(8),
            SizeConfig.getScaleWidth(4),
            SizeConfig.getScaleWidth(8),
            SizeConfig.getScaleWidth(4)),
        child: Text(
          strings.see_more,
          style: TextStyle(
              color: ThemeUtilities.seemoreTextColor,
              fontSize: SizeConfig.getScaleFontSize(14),
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
