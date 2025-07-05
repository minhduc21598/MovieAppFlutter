import 'package:flutter/material.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/widgets/shimmer_loading/item_shimmer.dart';

class ItemMovieShimmer extends StatelessWidget {
  const ItemMovieShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final itemSize =
        (SizeConfig.screenWidth - SizeConfig.getScaleWidth(40)) / 2;

    return SizedBox(
      width: itemSize,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemShimmer(
            width: itemSize,
            height: SizeConfig.getScaleHeight(213),
          ),
          SizedBox(
            height: SizeConfig.getScaleHeight(12),
          ),
          ItemShimmer(
            width: itemSize,
            height: SizeConfig.getScaleHeight(20),
            borderRadius: SizeConfig.getScaleWidth(100),
          ),
          SizedBox(
            height: SizeConfig.getScaleHeight(8),
          ),
          ItemShimmer(
            width: SizeConfig.getScaleWidth(100),
            height: SizeConfig.getScaleHeight(20),
            borderRadius: SizeConfig.getScaleWidth(100),
          ),
        ],
      ),
    );
  }
}