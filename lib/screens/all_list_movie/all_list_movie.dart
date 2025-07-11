import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_world/constants/api_endpoint.dart';
import 'package:movie_world/constants/movie_type.dart';
import 'package:movie_world/constants/route_name.dart';
import 'package:movie_world/core/network_client.dart';
import 'package:movie_world/gen/assets.gen.dart';
import 'package:movie_world/gen/strings.dart';
import 'package:movie_world/provider/language_provider.dart';
import 'package:movie_world/screens/all_list_movie/components/all_list_shimmer_screen/all_list_shimmer.dart';
import 'package:movie_world/screens/home_page/models/movie_model.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/widgets/header_search_bar.dart';
import 'package:movie_world/widgets/horizontal_movie_list/components/movie_item.dart';
import 'package:movie_world/widgets/image_show.dart';
import 'package:movie_world/widgets/loading_footer.dart';
import 'package:movie_world/widgets/screen_common_appbar.dart';
import 'package:movie_world/widgets/scroll_to_top_button.dart';
import 'package:movie_world/widgets/shimmer_loading/shimmer.dart';
import 'package:movie_world/widgets/svg_show.dart';
import 'package:provider/provider.dart';

class AllListMovie extends StatefulWidget {
  final MovieType movieType;
  final String? keywordSearch;
  const AllListMovie({super.key, required this.movieType, this.keywordSearch});

  @override
  State<AllListMovie> createState() => _AllListMovieState();
}

class _AllListMovieState extends State<AllListMovie> {
  bool isLoading = false;
  bool isLoadingMore = false;
  bool showScrollToTop = false;
  int page = 1;
  int totalResult = 0;
  List<MovieModel> movies = [];
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(onScroll);
    getListMovie();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  void onScroll() {
    if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent &&
        movies.length < totalResult) {
      loadMoreMovie();
    }

    if (scrollController.offset > SizeConfig.screenHeight && !showScrollToTop) {
      setState(() => showScrollToTop = true);
    } else if (scrollController.offset <= SizeConfig.screenHeight &&
        showScrollToTop) {
      setState(() => showScrollToTop = false);
    }
  }

  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
    );
  }

  Future<void> onRefresh() async {
    page = 1;
    getListMovie();
  }

  Future<void> loadMoreMovie() async {
    setState(() {
      isLoadingMore = true;
    });

    try {
      final endpoint = getEndpointByType();
      final language = context.read<LanguageProvider>().language;
      final param = widget.movieType != MovieType.search
          ? {'page': ++page, 'language': language}
          : {
              'page': ++page,
              'query': widget.keywordSearch,
              'language': language
            };

      Response response =
          await NetworkClient.dio.get(endpoint, queryParameters: param);
      final newMovies = (response.data['results'] as List)
          .map((item) => MovieModel.fromJson(item as Map<String, dynamic>))
          .toList();
      setState(() {
        setState(() {
          isLoadingMore = false;
        });
        movies.addAll(newMovies);
      });

      isLoading = false;
    } catch (error) {
      setState(() {
        isLoadingMore = false;
      });
    }
  }

  Future<void> getListMovie() async {
    isLoading = true;

    try {
      final endpoint = getEndpointByType();
      final language = context.read<LanguageProvider>().language;
      final param = widget.movieType != MovieType.search
          ? {'page': 1, 'language': language}
          : {'page': 1, 'query': widget.keywordSearch, 'language': language};

      Response response =
          await NetworkClient.dio.get(endpoint, queryParameters: param);
      setState(() {
        movies = (response.data['results'] as List)
            .map((item) => MovieModel.fromJson(item as Map<String, dynamic>))
            .toList();
      });
      totalResult = response.data['total_results'];

      isLoading = false;
    } catch (error) {
      isLoading = false;
    }
  }

  String getEndpointByType() {
    switch (widget.movieType) {
      case MovieType.nowShowing:
        return ApiEndpoint.nowPlaying;
      case MovieType.popular:
        return ApiEndpoint.popular;
      case MovieType.topRated:
        return ApiEndpoint.topRated;
      case MovieType.upComing:
        return ApiEndpoint.upcoming;
      case MovieType.search:
        return ApiEndpoint.searchByKeyword;
    }
  }

  String getTitleByType() {
    final Strings strings = Strings.of(context)!;

    switch (widget.movieType) {
      case MovieType.nowShowing:
        return strings.now_showing;
      case MovieType.popular:
        return strings.popular;
      case MovieType.topRated:
        return strings.top_rated;
      case MovieType.upComing:
        return strings.upcoming;
      case MovieType.search:
        return '';
    }
  }

  void backToSuggestKeyword(BuildContext context) {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final title = getTitleByType();
    final Strings strings = Strings.of(context)!;
    final itemSize =
        (SizeConfig.screenWidth - SizeConfig.getScaleWidth(44)) / 2;

    return ScreenCommonAppBar(
      noAppBar: widget.movieType == MovieType.search,
      title: title,
      floatingActionButton:
          showScrollToTop ? ScrollToTopButton(scrollToTop: scrollToTop) : null,
      appBarActions: widget.movieType != MovieType.search
          ? [
              GestureDetector(
                onTap: () {
                  context.push(RouteName.listSuggestKeyword);
                },
                child: SvgShow(uri: Assets.icons.icSearch),
              )
            ]
          : null,
      child: Column(
        children: [
          if (widget.movieType == MovieType.search)
            HeaderSearchBar(
              valueSearchbar: widget.keywordSearch,
              onPress: () {
                backToSuggestKeyword(context);
              },
            ),
          isLoading
              ? Expanded(
                  child: Shimmer(
                  child: AllListShimmer(isLoading: isLoading),
                ))
              : movies.isNotEmpty
                  ? Expanded(
                      child: RefreshIndicator(
                          onRefresh: onRefresh,
                          child: GridView.builder(
                            controller: scrollController,
                            padding: EdgeInsets.only(
                                left: SizeConfig.getScaleWidth(16),
                                right: SizeConfig.getScaleWidth(16),
                                top: SizeConfig.getScaleWidth(12)),
                            itemCount: movies.length,
                            itemBuilder: (context, index) {
                              final movie = movies[index];

                              return MovieItem(
                                posterPath: movie.posterPath,
                                title: movie.title,
                                voteAverage: movie.voteAverage,
                                movieId: movie.id,
                                imageWidth: itemSize,
                                imageHeight: SizeConfig.getScaleHeight(240),
                              );
                            },
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // 3 columns
                              crossAxisSpacing: SizeConfig.getScaleWidth(
                                  12), // spacing between columns
                              mainAxisSpacing: 0, // spacing between rows
                              childAspectRatio: 1 / 2.1, // width / height
                            ),
                          )))
                  : Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: SizeConfig.getScaleHeight(16),
                        children: [
                          ImageShow(
                              uri: Assets.images.noSearchResult,
                              isLocalImage: true,
                              height: SizeConfig.getScaleWidth(150),
                              width: SizeConfig.getScaleWidth(150)),
                          Text(
                            strings.no_result,
                            style: TextStyle(
                                fontSize: SizeConfig.getScaleFontSize(16),
                                fontWeight: FontWeight.w500,
                                color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
          if (isLoadingMore) LoadingFooter()
        ],
      ),
    );
  }
}
