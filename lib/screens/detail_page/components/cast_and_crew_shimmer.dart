import 'package:flutter/material.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/widgets/shimmer_loading/item_shimmer.dart';
import 'package:movie_world/widgets/shimmer_loading/shimmer_loading.dart';

class CastAndCrewShimmer extends StatelessWidget {
  final bool isLoading;
  const CastAndCrewShimmer({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.getScaleWidth(80),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return ShimmerLoading(
              isLoading: isLoading,
              child: Align(
                alignment: Alignment.topCenter,
                child: ItemShimmer(
                  width: SizeConfig.getScaleWidth(80),
                  height: SizeConfig.getScaleWidth(80),
                ),
              ));
        },
        separatorBuilder: (context, index) => SizedBox(
          width: SizeConfig.getScaleWidth(16),
        ),
      ),
    );
  }
}
