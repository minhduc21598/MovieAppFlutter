import 'package:flutter/material.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/widgets/shimmer_loading/shimmer_loading.dart';
import 'package:movie_world/widgets/vertical_movie_list/components/vertical_movie_list_shimmer/item_vertical_list_shimmer.dart';

class VerticalListShimmer extends StatelessWidget {
  final bool isLoading;
  const VerticalListShimmer({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        return ShimmerLoading(
            isLoading: isLoading, child: ItemVerticalListShimmer());
      },
      separatorBuilder: (context, index) => SizedBox(
        height: SizeConfig.getScaleHeight(16),
      ),
    );
  }
}
