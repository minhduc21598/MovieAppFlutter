import 'package:flutter/material.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/widgets/shimmer_loading/item_shimmer.dart';
import 'package:movie_world/widgets/shimmer_loading/shimmer_loading.dart';

class DetailShimmerScreen extends StatelessWidget {
  final bool isLoading;
  const DetailShimmerScreen({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      color: Color(0xFFFFFFFF),
      child: ShimmerLoading(
          isLoading: isLoading,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ItemShimmer(
              width: SizeConfig.screenWidth,
              height: SizeConfig.getScaleHeight(250),
              borderRadius: 0,
            ),
            SizedBox(
              height: SizeConfig.getScaleHeight(24),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemShimmer(
                    width:
                        SizeConfig.screenWidth - SizeConfig.getScaleWidth(32),
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
                  SizedBox(
                    height: SizeConfig.getScaleHeight(32),
                  ),
                  ItemShimmer(
                    width: SizeConfig.screenWidth * 3 / 4,
                    height: SizeConfig.getScaleHeight(20),
                    borderRadius: SizeConfig.getScaleWidth(100),
                  ),
                  SizedBox(
                    height: SizeConfig.getScaleHeight(32),
                  ),
                  Row(
                    spacing: SizeConfig.getScaleWidth(32),
                    children: [
                      ItemShimmer(
                        width: SizeConfig.getScaleWidth(80),
                        height: SizeConfig.getScaleWidth(80),
                      ),
                      ItemShimmer(
                        width: SizeConfig.getScaleWidth(80),
                        height: SizeConfig.getScaleWidth(80),
                      ),
                      ItemShimmer(
                        width: SizeConfig.getScaleWidth(80),
                        height: SizeConfig.getScaleWidth(80),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.getScaleHeight(32),
                  ),
                  ItemShimmer(
                    width: SizeConfig.getScaleWidth(80),
                    height: SizeConfig.getScaleHeight(20),
                    borderRadius: SizeConfig.getScaleWidth(100),
                  ),
                  SizedBox(
                    height: SizeConfig.getScaleHeight(16),
                  ),
                  ItemShimmer(
                    width:
                        SizeConfig.screenWidth - SizeConfig.getScaleWidth(32),
                    height: SizeConfig.getScaleHeight(200),
                  ),
                ],
              ),
            )
          ])),
    );
  }
}
