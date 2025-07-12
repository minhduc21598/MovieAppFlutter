import 'package:flutter/material.dart';
import 'package:movie_world/constants/api_endpoint.dart';
import 'package:movie_world/gen/assets.gen.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/utilities/theme_utilities.dart';
import 'package:movie_world/widgets/image_show.dart';
import 'package:movie_world/widgets/svg_show.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemTrailer extends StatelessWidget {
  final String videoKey;
  final String videoName;
  final String backdropPath;
  const ItemTrailer(
      {super.key,
      required this.videoKey,
      required this.videoName,
      required this.backdropPath});

  Future<void> openYouTubeVideo() async {
    final Uri youtubeAppUrl = Uri.parse('vnd.youtube:$videoKey');
    final Uri youtubeWebUrl = Uri.parse('${ApiEndpoint.youtubeLink}$videoKey');

    // Try opening the app
    if (await canLaunchUrl(youtubeAppUrl)) {
      await launchUrl(youtubeAppUrl);
    } else {
      // Fallback to browser
      await launchUrl(youtubeWebUrl, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openYouTubeVideo();
      },
      child: SizedBox(
        width: SizeConfig.getScaleWidth(150),
        child: Column(
          spacing: SizeConfig.getScaleHeight(4),
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ImageShow(
                  height: SizeConfig.getScaleHeight(90),
                  width: SizeConfig.getScaleWidth(150),
                  fitType: BoxFit.fill,
                  uri: backdropPath,
                ),
                Center(
                  child: SvgShow(
                    uri: Assets.icons.icPlayVideo,
                    iconSize: SizeConfig.getScaleWidth(35),
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Text(
              videoName,
              style: TextStyle(
                  fontSize: SizeConfig.getScaleFontSize(14),
                  color: ThemeUtilities.primaryTextColor),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
