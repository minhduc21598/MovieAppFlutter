import 'package:go_router/go_router.dart';
import 'package:movie_world/constants/movie_type.dart';
import 'package:movie_world/constants/route_name.dart';
import 'package:movie_world/screens/all_cast_and_crew/all_cast_and_crew.dart';
import 'package:movie_world/screens/all_list_movie/all_list_movie.dart';
import 'package:movie_world/screens/detail_page/detail_page_screen.dart';
import 'package:movie_world/screens/home_page/home_page_screen.dart';

class MainRouter {
  static GoRouter build() {
    return GoRouter(
      initialLocation: RouteName.homePage,
      routes: [
        GoRoute(
          path: RouteName.homePage,
          builder: (context, state) => const HomePageScreen(),
        ),
        GoRoute(
          path: '${RouteName.detailPage}/:movieId',
          builder: (context, state) => DetailPageScreen(
              movieId: int.parse(state.pathParameters['movieId']!)),
        ),
        GoRoute(
          path: '${RouteName.allCastAndCrew}/:isCast',
          builder: (context, state) => AllCastAndCrew(
            isCast: bool.parse(state.pathParameters['isCast']!),
          ),
        ),
        GoRoute(
          path: '${RouteName.allListMovie}/:movieType',
          builder: (context, state) => AllListMovie(
            movieType: MovieType.values
                .byName(state.pathParameters['movieType'] ?? ''),
          ),
        ),
      ],
    );
  }
}
