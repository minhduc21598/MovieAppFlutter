import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_world/constants/language_key.dart';
import 'package:movie_world/core/network_client.dart';
import 'package:movie_world/screens/home_page/models/movie_model.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/widgets/horizontal_movie_list/components/horizontal_list_shimmer/horizontal_list_shimmer.dart';
import 'package:movie_world/widgets/horizontal_movie_list/components/movie_item.dart';
import 'package:movie_world/widgets/shimmer_loading/shimmer.dart';
import 'package:movie_world/widgets/title_category/title_category.dart';

class HorizontalMovieList extends StatefulWidget {
  final String endpoint;
  final String title;
  final Function? onSeeMore;
  final String? language;
  const HorizontalMovieList(
      {super.key,
      required this.endpoint,
      required this.title,
      this.onSeeMore,
      this.language});

  @override
  State<HorizontalMovieList> createState() => _HorizontalMovieListState();
}

class _HorizontalMovieListState extends State<HorizontalMovieList> {
  List<MovieModel> movies = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getListMovie();
  }

  @override
  void didUpdateWidget(covariant HorizontalMovieList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.language != widget.language) {
      getListMovie();
    }
  }

  Future<void> getListMovie() async {
    setState(() {
      isLoading = true;
      if (movies.isNotEmpty) {
        movies = [];
      }
    });
    try {
      Response response = await NetworkClient.dio.get(widget.endpoint,
          queryParameters: {
            'language': widget.language ?? LanguageKey.english
          });
      setState(() {
        movies = (response.data['results'] as List)
            .map((item) => MovieModel.fromJson(item as Map<String, dynamic>))
            .toList();
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: SizeConfig.getScaleHeight(16),
      children: [
        if (movies.isNotEmpty)
          TitleCategory(
            title: widget.title,
            onSeeMore: widget.onSeeMore,
          ),
        if (movies.isEmpty && isLoading)
          Shimmer(
              child: HorizontalListShimmer(
            isLoading: isLoading,
          )),
        if (movies.isNotEmpty && !isLoading)
          SizedBox(
            height: SizeConfig.getScaleHeight(320),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length < 10
                  ? movies.length
                  : movies.sublist(0, 10).length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return MovieItem(
                  posterPath: movie.posterPath,
                  title: movie.title,
                  voteAverage: movie.voteAverage,
                  movieId: movie.id,
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                width: SizeConfig.getScaleWidth(16),
              ),
            ),
          ),
      ],
    );
  }
}
