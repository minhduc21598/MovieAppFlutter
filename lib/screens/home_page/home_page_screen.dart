import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_world/constants/api_endpoint.dart';
import 'package:movie_world/constants/movie_type.dart';
import 'package:movie_world/constants/route_name.dart';
import 'package:movie_world/gen/assets.gen.dart';
import 'package:movie_world/gen/strings.dart';
import 'package:movie_world/screens/all_list_movie/all_list_movie_param.dart';
import 'package:movie_world/screens/home_page/drawer_item/drawer_item.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/widgets/horizontal_movie_list/horizontal_movie_list.dart';
import 'package:movie_world/widgets/screen_common_appbar.dart';
import 'package:movie_world/widgets/svg_show.dart';
import 'package:movie_world/widgets/vertical_movie_list/vertical_movie_list.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  void goToAllMovieList(BuildContext context) {
    final param = AllListMovieParam(movieType: MovieType.nowShowing);
    context.push(RouteName.allListMovie, extra: param);
  }

  @override
  Widget build(BuildContext context) {
    final Strings strings = Strings.of(context)!;

    return ScreenCommonAppBar(
        title: strings.homepage,
        drawerItem: DrawerItem(),
        appBarActions: [
          GestureDetector(
            onTap: () {
              context.push(RouteName.listSuggestKeyword);
            },
            child: SvgShow(uri: Assets.icons.icSearch),
          )
        ],
        child: SingleChildScrollView(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.getScaleWidth(16)),
          child: Column(
            children: [
              HorizontalMovieList(
                endpoint: ApiEndpoint.nowPlaying,
                title: strings.now_showing,
                onSeeMore: () {
                  goToAllMovieList(context);
                },
              ),
              Column(
                spacing: SizeConfig.getScaleHeight(16),
                children: [
                  VerticalMovieList(
                    title: strings.popular,
                    apiEndpoint: ApiEndpoint.popular,
                    movieType: MovieType.popular,
                  ),
                  VerticalMovieList(
                    title: strings.top_rated,
                    apiEndpoint: ApiEndpoint.topRated,
                    movieType: MovieType.topRated,
                  ),
                  VerticalMovieList(
                    title: strings.upcoming,
                    apiEndpoint: ApiEndpoint.upcoming,
                    movieType: MovieType.upComing,
                  )
                ],
              )
            ],
          ),
        ));
  }
}
