import 'package:flutter/material.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';

class ItemShimmer extends StatelessWidget {
  final double width;
  final double height;
  final double? borderRadius;
  const ItemShimmer(
      {super.key,
      required this.width,
      required this.height,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.rectangle,
        borderRadius:
            BorderRadius.circular(borderRadius ?? SizeConfig.getScaleWidth(8)),
      ),
    );
  }
}
