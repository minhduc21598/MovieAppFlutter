import 'package:flutter/material.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/widgets/list_genre_label/genre_label.dart';

class ListGenreLabel extends StatelessWidget {
  final List<String> genres;
  const ListGenreLabel({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: SizeConfig.getScaleWidth(8),
      runSpacing: SizeConfig.getScaleHeight(8),
      children: [
        for (var genre in genres)
          GenreLabel(
            content: genre,
          )
      ],
    );
  }
}
