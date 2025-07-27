import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_world/core/network_client.dart';
import 'package:movie_world/provider/language_provider.dart';
import 'package:movie_world/screens/home_page/models/movie_model.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/widgets/horizontal_movie_list/components/horizontal_list_shimmer/horizontal_list_shimmer.dart';
import 'package:movie_world/widgets/horizontal_movie_list/components/movie_item.dart';
import 'package:movie_world/widgets/shimmer_loading/shimmer.dart';
import 'package:movie_world/widgets/title_category/title_category.dart';
import 'package:provider/provider.dart';

class HorizontalMovieList extends StatefulWidget {
  final String endpoint;
  final String title;
  final Function? onSeeMore;
  const HorizontalMovieList(
      {super.key, required this.endpoint, required this.title, this.onSeeMore});

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
  void didChangeDependencies() {
    super.didChangeDependencies();
    final language = context.watch<LanguageProvider>().language;
    getListMovie(language);
  }

  Future<void> getListMovie([String? language]) async {
    setState(() {
      isLoading = true;
      if (movies.isNotEmpty) {
        movies = [];
      }
    });

    try {
      final defaultLanguage = context.read<LanguageProvider>().language;
      Response response = await NetworkClient.dio.get(widget.endpoint,
          queryParameters: {'language': language ?? defaultLanguage});
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
