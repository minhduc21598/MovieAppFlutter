import 'package:flutter/material.dart';
import 'package:movie_world/constants/api_endpoint.dart';
import 'package:movie_world/gen/assets.gen.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/utilities/theme_utilities.dart';

class ImageShow extends StatelessWidget {
  final bool? isLocalImage;
  final String? uri;
  final double width;
  final double height;
  final double? borderRadius;
  final BoxFit? fitType;
  const ImageShow(
      {super.key,
      this.isLocalImage,
      this.uri,
      required this.height,
      required this.width,
      this.fitType = BoxFit.contain,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    if (isLocalImage != null && isLocalImage!) {
      return ClipRRect(
        borderRadius:
            BorderRadius.circular(borderRadius ?? SizeConfig.getScaleWidth(8)),
        child: Image.asset(
          '$uri',
          width: width,
          height: height,
          fit: fitType,
        ),
      );
    }
    return ClipRRect(
      borderRadius:
          BorderRadius.circular(borderRadius ?? SizeConfig.getScaleWidth(8)),
      child: uri != null && uri!.isNotEmpty
          ? Image.network(
              '${ApiEndpoint.baseImageUrl}$uri',
              width: width,
              height: height,
              fit: fitType,
            )
          : Container(
              width: width,
              height: height,
              color: ThemeUtilities.imagePlaceholderBackground,
              child: Center(
                child: Image.asset(
                  Assets.images.imagePlaceholder,
                  width: SizeConfig.getScaleWidth(50),
                  height: SizeConfig.getScaleWidth(50),
                  fit: BoxFit.contain,
                ),
              ),
            ),
    );
  }
}
