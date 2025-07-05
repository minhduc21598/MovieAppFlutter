import 'package:flutter/material.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/widgets/shimmer_loading/item_shimmer.dart';

class ItemHorizontalListShimmer extends StatelessWidget {
  const ItemHorizontalListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.getScaleWidth(143),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemShimmer(
            width: SizeConfig.getScaleWidth(143),
            height: SizeConfig.getScaleHeight(213),
          ),
          SizedBox(
            height: SizeConfig.getScaleHeight(12),
          ),
          ItemShimmer(
            width: SizeConfig.getScaleWidth(143),
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
