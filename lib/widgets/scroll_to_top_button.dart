import 'package:flutter/material.dart';
import 'package:movie_world/gen/assets.gen.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/utilities/theme_utilities.dart';
import 'package:movie_world/widgets/svg_show.dart';

class ScrollToTopButton extends StatelessWidget {
  final Function scrollToTop;
  const ScrollToTopButton({super.key, required this.scrollToTop});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        scrollToTop();
      },
      child: Container(
        alignment: Alignment.center,
        width: SizeConfig.getScaleWidth(50),
        height: SizeConfig.getScaleWidth(50),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ThemeUtilities.floatButtonBackground,
        ),
        child: SvgShow(
          uri: Assets.icons.icDoubleArrow,
          iconSize: SizeConfig.getScaleWidth(28),
        ),
      ),
    );
  }
}
