import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_world/constants/route_name.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/utilities/theme_utilities.dart';
import 'package:movie_world/widgets/image_show.dart';
import 'package:movie_world/widgets/list_genre_label/list_genre_label.dart';
import 'package:movie_world/widgets/rating_point.dart';

class MovieItem extends StatelessWidget {
  final String? posterPath;
  final String? title;
  final double? voteAverage;
  final List<String>? genres;
  final int? movieId;
  const MovieItem(
      {super.key,
      this.posterPath,
      this.title,
      this.voteAverage,
      this.genres,
      this.movieId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('${RouteName.detailPage}/${movieId.toString()}');
      },
      child: Row(
        spacing: SizeConfig.getScaleWidth(16),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageShow(
            height: SizeConfig.getScaleHeight(128),
            width: SizeConfig.getScaleWidth(85),
            fitType: BoxFit.fill,
            uri: posterPath,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: SizeConfig.getScaleHeight(8),
            children: [
              Text(
                title ?? '',
                style: TextStyle(
                  fontSize: SizeConfig.getScaleFontSize(14),
                  fontWeight: FontWeight.bold,
                  color: ThemeUtilities.primaryTextColor,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              RatingPoint(rate: voteAverage ?? 0),
              ListGenreLabel(genres: genres ?? [])
            ],
          ))
        ],
      ),
    );
  }
}
