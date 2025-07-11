import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/utilities/theme_utilities.dart';

class SvgShow extends StatelessWidget {
  final String uri;
  final double? iconSize;
  final Color? color;
  final bool? noColorFilter;
  const SvgShow(
      {super.key,
      required this.uri,
      this.iconSize,
      this.color,
      this.noColorFilter});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      uri,
      height: iconSize ?? SizeConfig.getScaleWidth(24),
      width: iconSize ?? SizeConfig.getScaleWidth(24),
      colorFilter: (noColorFilter == true)
          ? null
          : ColorFilter.mode(
              color ?? ThemeUtilities.iconColor, BlendMode.srcIn),
      fit: BoxFit.contain,
    );
  }
}
