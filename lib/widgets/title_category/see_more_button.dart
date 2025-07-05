import 'package:flutter/material.dart';
import 'package:movie_world/gen/strings.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';

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
        decoration: BoxDecoration(
            border: Border.all(
                width: SizeConfig.getScaleWidth(1), color: Color(0xFFE5E4EA)),
            borderRadius: BorderRadius.all(
                Radius.circular(SizeConfig.getScaleWidth(100)))),
        padding: EdgeInsets.fromLTRB(
            SizeConfig.getScaleWidth(8),
            SizeConfig.getScaleWidth(4),
            SizeConfig.getScaleWidth(8),
            SizeConfig.getScaleWidth(4)),
        child: Text(
          strings.see_more,
          style: TextStyle(
              color: Color(0xFFAAA9B1),
              fontSize: SizeConfig.getScaleFontSize(10),
              fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
