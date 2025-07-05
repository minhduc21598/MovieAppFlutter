import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_world/constants/api_endpoint.dart';
import 'package:movie_world/constants/movie_type.dart';
import 'package:movie_world/constants/route_name.dart';
import 'package:movie_world/core/network_client.dart';
import 'package:movie_world/screens/home_page/models/genre_model.dart';
import 'package:movie_world/screens/home_page/models/movie_model.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/widgets/shimmer_loading/shimmer.dart';
import 'package:movie_world/widgets/title_category/title_category.dart';
import 'package:movie_world/widgets/vertical_movie_list/components/movie_item.dart';
import 'package:movie_world/widgets/vertical_movie_list/components/vertical_movie_list_shimmer/vertical_list_shimmer.dart';

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

  void _fetchData() {
    getListMovies();
    getListGenres();
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> getListGenres() async {
    isLoadingGenres = true;
    try {
      Response response = await NetworkClient.dio.get(ApiEndpoint.genres);
      setState(() {
        genresData = (response.data['genres'] as List)
            .map((item) => GenreModel.fromJson(item as Map<String, dynamic>))
            .toList();
      });
      isLoadingGenres = false;
    } catch (error) {
      isLoadingGenres = false;
    }
  }

  Future<void> getListMovies() async {
    isLoadingMovies = true;
    try {
      Response response = await NetworkClient.dio.get(widget.apiEndpoint);
      setState(() {
        movies = (response.data['results'] as List)
            .map((item) => MovieModel.fromJson(item as Map<String, dynamic>))
            .toList()
            .sublist(0, widget.limitItemShow);
      });
      isLoadingMovies = false;
    } catch (error) {
      isLoadingMovies = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: SizeConfig.getScaleHeight(16),
      children: [
        TitleCategory(
          title: widget.title,
          onSeeMore: () {
            if (isLoadingMovies || isLoadingGenres) {
              return;
            }
            context.push(
                '${RouteName.allListMovie}/${widget.movieType?.name ?? MovieType.nowShowing.name}');
          },
        ),
        isLoadingMovies || isLoadingGenres
            ? Shimmer(
                child: VerticalListShimmer(
                    isLoading: isLoadingMovies || isLoadingGenres))
            : ListView.separated(
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
