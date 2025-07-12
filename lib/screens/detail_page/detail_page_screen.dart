import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_world/constants/api_endpoint.dart';
import 'package:movie_world/core/network_client.dart';
import 'package:movie_world/gen/strings.dart';
import 'package:movie_world/provider/language_provider.dart';
import 'package:movie_world/screens/detail_page/components/addtional_info.dart';
import 'package:movie_world/screens/detail_page/components/cast_and_crew.dart';
import 'package:movie_world/screens/detail_page/components/detail_shimmer_screen.dart';
import 'package:movie_world/screens/detail_page/components/movie_trailers.dart';
import 'package:movie_world/screens/detail_page/models/detail_movie_model.dart';
import 'package:movie_world/utilities/function_utilities.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/widgets/back_closing_button.dart';
import 'package:movie_world/widgets/horizontal_movie_list/horizontal_movie_list.dart';
import 'package:movie_world/widgets/image_show.dart';
import 'package:movie_world/widgets/list_genre_label/list_genre_label.dart';
import 'package:movie_world/widgets/rating_point.dart';
import 'package:movie_world/widgets/shimmer_loading/shimmer.dart';
import 'package:provider/provider.dart';

class DetailPageScreen extends StatefulWidget {
  final int movieId;
  const DetailPageScreen({super.key, required this.movieId});

  @override
  State<DetailPageScreen> createState() => _DetailPageScreenState();
}

class _DetailPageScreenState extends State<DetailPageScreen> {
  bool isLoading = false;
  bool _isCollapsed = false;
  DetailMovieModel? detailData;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    getDetailMovie();

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
        final offset = _scrollController.offset;
        final bool isCollapsedNow =
            offset > kToolbarHeight + SizeConfig.paddingTopFromStatusBar;

        if (_isCollapsed != isCollapsedNow) {
          setState(() {
            _isCollapsed = isCollapsedNow;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> getDetailMovie() async {
    isLoading = true;
    final language = context.read<LanguageProvider>().language;

    try {
      Response response = await NetworkClient.dio.get(
          '${ApiEndpoint.movie}/${widget.movieId}',
          queryParameters: {'language': language});
      setState(() {
        detailData = DetailMovieModel.fromJson(response.data);
      });

      isLoading = false;
    } catch (error) {
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Strings strings = Strings.of(context)!;
    final languages = detailData?.spokenLanguages
            ?.map((item) => item.name)
            .toList()
            .join(", ") ??
        '';
    final language = context.read<LanguageProvider>().language;

    return isLoading
        ? Shimmer(
            child: DetailShimmerScreen(isLoading: isLoading),
          )
        : Scaffold(
            backgroundColor: Colors.white,
            body: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: SizeConfig.getScaleHeight(180),
                  flexibleSpace: LayoutBuilder(
                    builder: (context, constraints) {
                      final double top = constraints.biggest.height;
                      final appBarMinHeight =
                          kToolbarHeight + SizeConfig.paddingTopFromStatusBar;

                      return FlexibleSpaceBar(
                        background: ImageShow(
                          height: SizeConfig.getScaleHeight(180),
                          width: SizeConfig.screenWidth,
                          fitType: BoxFit.fill,
                          uri: detailData?.backdropPath,
                          borderRadius: 0,
                        ),
                        title: top <= appBarMinHeight
                            ? Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: SizeConfig.getScaleWidth(48)),
                                child: Text(
                                  detailData?.title ?? '',
                                  style: TextStyle(
                                      fontSize: SizeConfig.getScaleFontSize(16),
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF000000)),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textWidthBasis: TextWidthBasis.parent,
                                ),
                              )
                            : null,
                        centerTitle: true,
                      );
                    },
                  ),
                  leading: Padding(
                    padding: EdgeInsets.all(SizeConfig.getScaleWidth(12)),
                    child: BackClosingButton(
                      color: _isCollapsed ? Colors.black54 : Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.white,
                ),
                SliverToBoxAdapter(
                  child: Container(
                    width: SizeConfig.screenWidth,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft:
                              Radius.circular(SizeConfig.getScaleWidth(16)),
                          topRight:
                              Radius.circular(SizeConfig.getScaleWidth(16))),
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.getScaleHeight(12),
                        horizontal: SizeConfig.getScaleWidth(16)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(detailData?.title ?? '',
                            style: TextStyle(
                                fontSize: SizeConfig.getScaleFontSize(20),
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF000000))),
                        SizedBox(
                          height: SizeConfig.getScaleHeight(8),
                        ),
                        RatingPoint(rate: detailData?.voteAverage ?? 0),
                        SizedBox(
                          height: SizeConfig.getScaleHeight(16),
                        ),
                        ListGenreLabel(
                            genres: detailData?.genres
                                    ?.map((item) => item.name ?? '')
                                    .toList() ??
                                []),
                        SizedBox(
                          height: SizeConfig.getScaleHeight(16),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // spacing: SizeConfig.getScaleHeight(8),
                          children: [
                            AddtionalInfo(
                                title: strings.length,
                                content: FunctionUtilities.formatMovieRunTime(
                                    detailData?.runtime ?? 0)),
                            if (languages.isNotEmpty)
                              AddtionalInfo(
                                  title: strings.language, content: languages),
                            if (detailData!.releaseDate!.isNotEmpty &&
                                detailData?.releaseDate != null)
                              AddtionalInfo(
                                  title: strings.release_date,
                                  content: FunctionUtilities.formatReleaseDate(
                                      detailData?.releaseDate ?? ''))
                          ],
                        ),
                        if (detailData?.overview != null &&
                            detailData!.overview!.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: SizeConfig.getScaleHeight(16),
                              ),
                              Text(strings.description,
                                  style: TextStyle(
                                      fontSize: SizeConfig.getScaleFontSize(16),
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF110E47))),
                              SizedBox(
                                height: SizeConfig.getScaleHeight(8),
                              ),
                              Text(detailData?.overview ?? '',
                                  style: TextStyle(
                                      fontSize: SizeConfig.getScaleFontSize(14),
                                      color: Color(0xFF9C9C9C))),
                            ],
                          ),
                        SizedBox(
                          height: SizeConfig.getScaleHeight(16),
                        ),
                        MovieTrailers(
                            movieId: widget.movieId,
                            backdropPath: detailData?.backdropPath ?? ''),
                        CastAndCrew(movieId: widget.movieId),
                        HorizontalMovieList(
                          endpoint:
                              '${ApiEndpoint.movie}/${widget.movieId}${ApiEndpoint.recommendations}',
                          title: strings.recommendations,
                          language: language,
                        ),
                        HorizontalMovieList(
                          endpoint:
                              '${ApiEndpoint.movie}/${widget.movieId}${ApiEndpoint.similar}',
                          title: strings.similar,
                          language: language,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ));
  }
}
