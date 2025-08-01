import 'package:flutter/material.dart';
import 'package:movie_world/gen/assets.gen.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/utilities/theme_utilities.dart';
import 'package:movie_world/widgets/svg_show.dart';

class RatingPoint extends StatelessWidget {
  final double rate;
  const RatingPoint({super.key, required this.rate});

  @override
  Widget build(BuildContext context) {
    final roundedRate = rate.toStringAsFixed(1);

    return Row(
      spacing: SizeConfig.getScaleWidth(4),
      children: [
        SvgShow(
          uri: Assets.icons.icRatingStar,
          iconSize: SizeConfig.getScaleHeight(12),
          noColorFilter: true,
        ),
        Text(
          '$roundedRate/10 IMDb',
          style: TextStyle(
              fontSize: SizeConfig.getScaleFontSize(14),
              fontWeight: FontWeight.normal,
              color: ThemeUtilities.secondaryTextColor),
        ),
      ],
    );
  }
}
