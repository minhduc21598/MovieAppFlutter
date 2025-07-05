import 'package:flutter/material.dart';
import 'package:movie_world/gen/assets.gen.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/widgets/image_show.dart';

class ItemCast extends StatelessWidget {
  final String? name;
  final String? characterName;
  final String? avatar;
  final double? avatarSize;
  final double? nameFontSize;
  final double? characterNameFontSize;
  const ItemCast(
      {super.key,
      this.name,
      this.characterName,
      this.avatar,
      this.avatarSize,
      this.nameFontSize,
      this.characterNameFontSize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: avatarSize ?? SizeConfig.getScaleWidth(80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: SizeConfig.getScaleHeight(4),
        children: [
          ImageShow(
            height: avatarSize ?? SizeConfig.getScaleWidth(80),
            width: avatarSize ?? SizeConfig.getScaleWidth(80),
            fitType: BoxFit.cover,
            isLocalImage: avatar == null,
            uri: avatar ?? Assets.images.defaultAvatar,
          ),
          Text(
            name ?? '',
            style: TextStyle(
                fontSize: nameFontSize ?? SizeConfig.getScaleFontSize(14)),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            characterName ?? '',
            style: TextStyle(
                fontSize:
                    characterNameFontSize ?? SizeConfig.getScaleFontSize(12),
                color: Color(0xFF9C9C9C)),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
