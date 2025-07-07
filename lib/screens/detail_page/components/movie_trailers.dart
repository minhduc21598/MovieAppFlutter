import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_world/constants/api_endpoint.dart';
import 'package:movie_world/constants/language_key.dart';
import 'package:movie_world/core/network_client.dart';
import 'package:movie_world/gen/strings.dart';
import 'package:movie_world/screens/detail_page/components/item_trailer.dart';
import 'package:movie_world/screens/detail_page/components/trailers_shimmer.dart';
import 'package:movie_world/screens/detail_page/models/trailer_model.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/widgets/shimmer_loading/shimmer.dart';
import 'package:movie_world/widgets/title_category/title_category.dart';

class MovieTrailers extends StatefulWidget {
  final int movieId;
  final String backdropPath;
  const MovieTrailers(
      {super.key, required this.movieId, required this.backdropPath});

  @override
  State<MovieTrailers> createState() => _MovieTrailersState();
}

class _MovieTrailersState extends State<MovieTrailers> {
  List<TrailerModel> trailers = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getTrailers();
  }

  Future<void> getTrailers() async {
    isLoading = true;
    try {
      Response response = await NetworkClient.dio.get(
          '${ApiEndpoint.movie}/${widget.movieId}${ApiEndpoint.videos}',
          queryParameters: {'language': LanguageKey.english});
      setState(() {
        trailers = (response.data['results'] as List)
            .map((item) => TrailerModel.fromJson(item as Map<String, dynamic>))
            .where((trailer) =>
                trailer.site == 'YouTube' &&
                trailer.type == 'Trailer' &&
                (trailer.size ?? 0) > 1080)
            .toList();
      });
      isLoading = false;
    } catch (e) {
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Strings strings = Strings.of(context)!;

    return Column(
      spacing: SizeConfig.getScaleHeight(16),
      children: [
        if (trailers.isNotEmpty)
          TitleCategory(
            title: strings.trailers,
          ),
        if (trailers.isEmpty && isLoading)
          Column(
            children: [
              Shimmer(
                child: TrailersShimmer(isLoading: isLoading),
              ),
              SizedBox(
                height: SizeConfig.getScaleHeight(16),
              )
            ],
          ),
        if (trailers.isNotEmpty && !isLoading)
          SizedBox(
            height: SizeConfig.getScaleHeight(140),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: trailers.length < 5
                  ? trailers.length
                  : trailers.sublist(0, 5).length,
              itemBuilder: (context, index) {
                final trailer = trailers[index];
                return ItemTrailer(
                    videoKey: trailer.key ?? '',
                    videoName: trailer.name ?? '',
                    backdropPath: widget.backdropPath);
              },
              separatorBuilder: (context, index) => SizedBox(
                width: SizeConfig.getScaleWidth(16),
              ),
            ),
          )
      ],
    );
  }
}
