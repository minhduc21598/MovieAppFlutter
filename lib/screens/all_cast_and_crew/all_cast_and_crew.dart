import 'package:flutter/material.dart';
import 'package:movie_world/gen/strings.dart';
import 'package:movie_world/provider/cast_and_crew_provider.dart';
import 'package:movie_world/screens/detail_page/models/cast_model.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/widgets/item_cast.dart';
import 'package:movie_world/widgets/screen_common_appbar.dart';
import 'package:provider/provider.dart';

class AllCastAndCrew extends StatelessWidget {
  final bool? isCast;
  const AllCastAndCrew({super.key, this.isCast});

  @override
  Widget build(BuildContext context) {
    final Strings strings = Strings.of(context)!;
    final List<Cast> listCast = context.read<CastAndCrewProvider>().listCast;
    final List<Crew> listCrew = context.read<CastAndCrewProvider>().listCrew;
    final showCast = isCast != null && isCast!;
    final itemSize =
        (SizeConfig.screenWidth - SizeConfig.getScaleWidth(48)) / 3;

    return ScreenCommonAppBar(
        title: isCast != null && isCast! ? strings.cast : strings.crew,
        child: GridView.builder(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.getScaleWidth(16)),
          itemCount: showCast ? listCast.length : listCrew.length,
          itemBuilder: (context, index) => ItemCast(
            avatar: showCast
                ? listCast[index].profilePath
                : listCrew[index].profilePath,
            name: showCast ? listCast[index].name : listCrew[index].name,
            characterName: showCast
                ? listCast[index].character
                : listCrew[index].department,
            nameFontSize: SizeConfig.getScaleFontSize(16),
            characterNameFontSize: SizeConfig.getScaleFontSize(14),
            avatarSize: itemSize,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 columns
            crossAxisSpacing:
                SizeConfig.getScaleWidth(8), // spacing between columns
            mainAxisSpacing: 0, // spacing between rows
            childAspectRatio:
                itemSize / SizeConfig.getScaleHeight(220), // width / height
          ),
        ));
  }
}
