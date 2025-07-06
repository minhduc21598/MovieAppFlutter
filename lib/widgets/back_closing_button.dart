import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_world/gen/assets.gen.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/widgets/svg_show.dart';

class BackClosingButton extends StatelessWidget {
  final Color? color;
  const BackClosingButton({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SvgShow(
        uri: Assets.icons.icBack,
        color: color ?? Colors.black54,
        iconSize: SizeConfig.getScaleWidth(30),
      ),
      onTap: () {
        context.pop();
      },
    );
  }
}
