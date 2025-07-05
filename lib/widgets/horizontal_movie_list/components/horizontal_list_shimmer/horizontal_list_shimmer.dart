import 'package:flutter/material.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/widgets/horizontal_movie_list/components/horizontal_list_shimmer/item_horizontal_list_shimmer.dart';
import 'package:movie_world/widgets/shimmer_loading/shimmer_loading.dart';

class HorizontalListShimmer extends StatelessWidget {
  final bool isLoading;
  const HorizontalListShimmer({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.getScaleHeight(320),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return ShimmerLoading(
              isLoading: isLoading, child: ItemHorizontalListShimmer());
        },
        separatorBuilder: (context, index) => SizedBox(
          width: SizeConfig.getScaleWidth(16),
        ),
      ),
    );
  }
}
