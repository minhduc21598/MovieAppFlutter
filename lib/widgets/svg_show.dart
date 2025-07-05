import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';

class SvgShow extends StatelessWidget {
  final String uri;
  final double? iconSize;
  final ColorFilter? colorFilter;
  const SvgShow({
    super.key,
    required this.uri,
    this.iconSize,
    this.colorFilter,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      uri,
      height: iconSize ?? SizeConfig.getScaleWidth(24),
      width: iconSize ?? SizeConfig.getScaleWidth(24),
      colorFilter: colorFilter,
    );
  }
}
