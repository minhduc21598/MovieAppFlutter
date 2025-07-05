import 'package:flutter/cupertino.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/widgets/shimmer_loading/item_shimmer.dart';
import 'package:movie_world/widgets/shimmer_loading/shimmer_loading.dart';

class TrailersShimmer extends StatelessWidget {
  final bool isLoading;
  const TrailersShimmer({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.getScaleHeight(90),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) {
          return ShimmerLoading(
              isLoading: isLoading,
              child: Align(
                alignment: Alignment.topCenter,
                child: ItemShimmer(
                  height: SizeConfig.getScaleHeight(90),
                  width: SizeConfig.getScaleWidth(150),
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
