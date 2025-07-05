import 'package:flutter/material.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/widgets/shimmer_loading/item_shimmer.dart';

class ItemVerticalListShimmer extends StatelessWidget {
  const ItemVerticalListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: SizeConfig.getScaleWidth(16),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ItemShimmer(
          width: SizeConfig.getScaleWidth(85),
          height: SizeConfig.getScaleHeight(128),
        ),
        Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: SizeConfig.getScaleHeight(8),
                children: [
              ItemShimmer(
                width: SizeConfig.getScaleWidth(220),
                height: SizeConfig.getScaleHeight(18),
                borderRadius: SizeConfig.getScaleWidth(100),
              ),
              ItemShimmer(
                width: SizeConfig.getScaleWidth(130),
                height: SizeConfig.getScaleHeight(18),
                borderRadius: SizeConfig.getScaleWidth(100),
              ),
              ItemShimmer(
                width: SizeConfig.getScaleWidth(143),
                height: SizeConfig.getScaleHeight(18),
                borderRadius: SizeConfig.getScaleWidth(100),
              ),
            ]))
      ],
    );
  }
}
