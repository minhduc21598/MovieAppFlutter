import 'package:movie_world/constants/movie_type.dart';

class AllListMovieParam {
  final MovieType movieType;
  final String? keywordSearch;
  AllListMovieParam({required this.movieType, this.keywordSearch});
}
