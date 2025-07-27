import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_world/constants/api_endpoint.dart';
import 'package:movie_world/constants/movie_type.dart';
import 'package:movie_world/constants/route_name.dart';
import 'package:movie_world/core/network_client.dart';
import 'package:movie_world/provider/language_provider.dart';
import 'package:movie_world/screens/all_list_movie/all_list_movie_param.dart';
import 'package:movie_world/screens/home_page/models/genre_model.dart';
import 'package:movie_world/screens/home_page/models/movie_model.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/widgets/shimmer_loading/shimmer.dart';
import 'package:movie_world/widgets/title_category/title_category.dart';
import 'package:movie_world/widgets/vertical_movie_list/components/movie_item.dart';
import 'package:movie_world/widgets/vertical_movie_list/components/vertical_movie_list_shimmer/vertical_list_shimmer.dart';
import 'package:provider/provider.dart';

class VerticalMovieList extends StatefulWidget {
  final String title;
  final String apiEndpoint;
  final int? limitItemShow;
  final MovieType? movieType;
  const VerticalMovieList(
      {super.key,
      required this.title,
      required this.apiEndpoint,
      this.limitItemShow = 5,
      this.movieType});

  @override
  State<VerticalMovieList> createState() => _VerticalMovieListState();
}

class _VerticalMovieListState extends State<VerticalMovieList> {
  List<MovieModel> movies = [];
  List<GenreModel> genresData = [];
  bool isLoadingMovies = false;
  bool isLoadingGenres = false;

  void _fetchData([String? language]) {
    getListMovies(language);
    getListGenres(language);
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final language = context.watch<LanguageProvider>().language;
    _fetchData(language);
  }

  Future<void> getListGenres([String? language]) async {
    setState(() {
      isLoadingGenres = true;
    });

    try {
      final defaultLanguage = context.read<LanguageProvider>().language;
      Response response = await NetworkClient.dio.get(ApiEndpoint.genres,
          queryParameters: {'language': language ?? defaultLanguage});
      setState(() {
        genresData = (response.data['genres'] as List)
            .map((item) => GenreModel.fromJson(item as Map<String, dynamic>))
            .toList();
        isLoadingGenres = false;
      });
    } catch (error) {
      setState(() {
        isLoadingGenres = false;
      });
    }
  }

  Future<void> getListMovies([String? language]) async {
    setState(() {
      isLoadingMovies = true;
      if (movies.isNotEmpty) {
        movies = [];
      }
    });

    try {
      final defaultLanguage = context.read<LanguageProvider>().language;
      Response response = await NetworkClient.dio.get(widget.apiEndpoint,
          queryParameters: {'language': language ?? defaultLanguage});
      setState(() {
        movies = (response.data['results'] as List)
            .map((item) => MovieModel.fromJson(item as Map<String, dynamic>))
            .toList()
            .sublist(0, widget.limitItemShow);
        isLoadingMovies = false;
      });
    } catch (error) {
      setState(() {
        isLoadingMovies = false;
      });
    }
  }

  void goToAllMovieList(BuildContext context) {
    if (isLoadingMovies || isLoadingGenres) {
      return;
    }

    final param =
        AllListMovieParam(movieType: widget.movieType ?? MovieType.nowShowing);
    context.push(RouteName.allListMovie, extra: param);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = isLoadingGenres || isLoadingMovies;

    return Column(
      spacing: SizeConfig.getScaleHeight(16),
      children: [
        if (movies.isNotEmpty)
          TitleCategory(
            title: widget.title,
            onSeeMore: () {
              goToAllMovieList(context);
            },
          ),
        if (movies.isEmpty && isLoading)
          Shimmer(
              child: VerticalListShimmer(
                  isLoading: isLoadingMovies || isLoadingGenres)),
        if (movies.isNotEmpty && !isLoading)
          ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final movie = movies[index];
                final genres = genresData
                    .where((genre) => movie.genreIds!.contains(genre.id))
                    .map((genre) => genre.name!)
                    .toList();

                return MovieItem(
                  posterPath: movie.posterPath,
                  title: movie.title,
                  voteAverage: movie.voteAverage,
                  genres: genres.length < 4 ? genres : genres.sublist(0, 3),
                  movieId: movie.id,
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                    height: SizeConfig.getScaleHeight(16),
                  ),
              itemCount: movies.length < (widget.limitItemShow ?? 0)
                  ? movies.length
                  : movies.sublist(0, widget.limitItemShow).length),
      ],
    );
  }
}
