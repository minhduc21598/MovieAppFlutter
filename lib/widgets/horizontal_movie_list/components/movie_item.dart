import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_world/constants/route_name.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/utilities/theme_utilities.dart';
import 'package:movie_world/widgets/image_show.dart';
import 'package:movie_world/widgets/rating_point.dart';

class MovieItem extends StatelessWidget {
  final String? posterPath;
  final String? title;
  final double? voteAverage;
  final int? movieId;
  final double? imageWidth;
  final double? imageHeight;

  const MovieItem(
      {super.key,
      this.posterPath,
      this.title,
      this.voteAverage,
      this.movieId,
      this.imageWidth,
      this.imageHeight});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('${RouteName.detailPage}/${movieId.toString()}');
      },
      child: SizedBox(
        width: imageWidth ?? SizeConfig.getScaleWidth(143),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageShow(
              height: imageHeight ?? SizeConfig.getScaleHeight(220),
              width: imageWidth ?? SizeConfig.getScaleWidth(143),
              fitType: BoxFit.fill,
              uri: posterPath,
            ),
            SizedBox(
              height: SizeConfig.getScaleHeight(12),
            ),
            Text(
              title ?? '',
              style: TextStyle(
                  fontSize: SizeConfig.getScaleFontSize(14),
                  fontWeight: FontWeight.bold,
                  color: ThemeUtilities.primaryTextColor),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: SizeConfig.getScaleHeight(8),
            ),
            RatingPoint(rate: voteAverage ?? 0)
          ],
        ),
      ),
    );
  }
}
