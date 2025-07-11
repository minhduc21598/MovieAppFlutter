import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_world/constants/api_endpoint.dart';
import 'package:movie_world/constants/route_name.dart';
import 'package:movie_world/core/network_client.dart';
import 'package:movie_world/gen/strings.dart';
import 'package:movie_world/screens/all_cast_and_crew/all_cast_and_crew_param.dart';
import 'package:movie_world/screens/detail_page/components/cast_and_crew_shimmer.dart';
import 'package:movie_world/screens/detail_page/models/cast_model.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/widgets/item_cast.dart';
import 'package:movie_world/widgets/shimmer_loading/shimmer.dart';
import 'package:movie_world/widgets/title_category/title_category.dart';

class CastAndCrew extends StatefulWidget {
  final int movieId;
  const CastAndCrew({super.key, required this.movieId});

  @override
  State<CastAndCrew> createState() => _CastAndCrewState();
}

class _CastAndCrewState extends State<CastAndCrew> {
  bool isLoading = false;
  CastModel? castData;

  @override
  void initState() {
    super.initState();
    getListCast();
  }

  Future<void> getListCast() async {
    isLoading = true;
    try {
      Response response = await NetworkClient.dio
          .get('${ApiEndpoint.movie}/${widget.movieId}${ApiEndpoint.credits}');
      final data = CastModel.fromJson(response.data);
      setState(() {
        castData = data;
      });
      isLoading = false;
    } catch (e) {
      isLoading = false;
    }
  }

  void goToAllCastAndCrew(bool isCast, BuildContext context) {
    if (isLoading) {
      return;
    }

    final param = AllCastAndCrewParam(
      isCast: isCast,
      listCast: castData?.cast,
      listCrew: castData?.crew,
    );
    context.push(RouteName.allCastAndCrew, extra: param);
  }

  @override
  Widget build(BuildContext context) {
    final Strings strings = Strings.of(context)!;

    return Column(
      spacing: SizeConfig.getScaleHeight(16),
      children: [
        if (castData?.cast != null && castData!.cast!.isNotEmpty)
          TitleCategory(
            title: strings.cast,
            onSeeMore: () {
              goToAllCastAndCrew(true, context);
            },
          ),
        if (isLoading)
          Column(
            children: [
              Shimmer(
                child: CastAndCrewShimmer(isLoading: isLoading),
              ),
              SizedBox(
                height: SizeConfig.getScaleHeight(16),
              )
            ],
          ),
        if (castData?.cast != null && castData!.cast!.isNotEmpty && !isLoading)
          SizedBox(
            height: SizeConfig.getScaleHeight(180),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: ((castData?.cast?.length ?? 0) < 10)
                  ? (castData?.cast?.length ?? 0)
                  : (castData?.cast?.sublist(0, 10).length ?? 0),
              itemBuilder: (context, index) {
                final castItem = castData?.cast![index];
                return ItemCast(
                  avatar: castItem?.profilePath,
                  name: castItem?.name,
                  characterName: castItem?.character,
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                width: SizeConfig.getScaleWidth(16),
              ),
            ),
          ),
        if (castData?.crew != null && castData!.crew!.isNotEmpty)
          TitleCategory(
            title: strings.crew,
            onSeeMore: () {
              goToAllCastAndCrew(false, context);
            },
          ),
        if (isLoading)
          Column(
            children: [
              Shimmer(
                child: CastAndCrewShimmer(isLoading: isLoading),
              ),
              SizedBox(
                height: SizeConfig.getScaleHeight(16),
              )
            ],
          ),
        if (castData?.crew != null && castData!.crew!.isNotEmpty && !isLoading)
          SizedBox(
            height: SizeConfig.getScaleHeight(180),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: ((castData?.crew?.length ?? 0) < 10)
                  ? (castData?.crew?.length ?? 0)
                  : (castData?.crew?.sublist(0, 10).length ?? 0),
              itemBuilder: (context, index) {
                final castItem = castData?.crew![index];
                return ItemCast(
                  avatar: castItem?.profilePath,
                  name: castItem?.name,
                  characterName: castItem?.department,
                );
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
