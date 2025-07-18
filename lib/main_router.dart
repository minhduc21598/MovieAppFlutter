import 'package:go_router/go_router.dart';
import 'package:movie_world/constants/route_name.dart';
import 'package:movie_world/screens/all_cast_and_crew/all_cast_and_crew.dart';
import 'package:movie_world/screens/all_cast_and_crew/all_cast_and_crew_param.dart';
import 'package:movie_world/screens/all_list_movie/all_list_movie.dart';
import 'package:movie_world/screens/all_list_movie/all_list_movie_param.dart';
import 'package:movie_world/screens/detail_page/detail_page_screen.dart';
import 'package:movie_world/screens/home_page/home_page_screen.dart';
import 'package:movie_world/screens/list_suggest_keyword/list_suggest_keyword.dart';

class MainRouter {
  static final MainRouter _singleton = MainRouter._internal();

  GoRouter? router;

  factory MainRouter() {
    return _singleton;
  }

  MainRouter._internal() {
    router =
        GoRouter(routes: _getAllRoutes(), initialLocation: RouteName.homePage);
  }

  List<RouteBase> _getAllRoutes() {
    return [
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
        path: RouteName.allCastAndCrew,
        builder: (context, state) {
          final castAndCrewParam = state.extra as AllCastAndCrewParam;

          return AllCastAndCrew(
            isCast: castAndCrewParam.isCast,
            listCast: castAndCrewParam.listCast,
            listCrew: castAndCrewParam.listCrew,
          );
        },
      ),
      GoRoute(
        path: RouteName.allListMovie,
        builder: (context, state) {
          final movieParam = state.extra as AllListMovieParam;

          return AllListMovie(
            movieType: movieParam.movieType,
            keywordSearch: movieParam.keywordSearch,
          );
        },
      ),
      GoRoute(
        path: RouteName.listSuggestKeyword,
        builder: (context, state) => const ListSuggestKeyword(),
      ),
    ];
  }
}
