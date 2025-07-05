import 'package:flutter/material.dart';
import 'package:movie_world/screens/all_list_movie/components/all_list_shimmer_screen/item_movie_shimmer.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/widgets/shimmer_loading/shimmer_loading.dart';

class AllListShimmer extends StatelessWidget {
  final bool isLoading;
  const AllListShimmer({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    final itemSize =
        (SizeConfig.screenWidth - SizeConfig.getScaleWidth(44)) / 2;

    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.getScaleWidth(16)),
      itemCount: 6,
      itemBuilder: (context, index) {
        return ShimmerLoading(isLoading: isLoading, child: ItemMovieShimmer());
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 3 columns
        crossAxisSpacing:
            SizeConfig.getScaleWidth(8), // spacing between columns
        mainAxisSpacing: 0, // spacing between rows
        childAspectRatio:
            itemSize / SizeConfig.getScaleHeight(300), // width / height
      ),
    );
  }
}
