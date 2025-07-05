import 'package:flutter/material.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/widgets/svg_show.dart';

import '../gen/assets.gen.dart';

class BackClosingButton extends StatelessWidget {
  final Function? onClose;
  final Color? color;
  const BackClosingButton({super.key, this.onClose, this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: SvgShow(
          uri: Assets.icons.icBack,
          iconSize: SizeConfig.getScaleWidth(30),
          colorFilter:
              ColorFilter.mode(color ?? Color(0xFF333333), BlendMode.srcIn),
        ),
        onPressed: () {
          if (onClose != null) {
            onClose!();
          }
        });
  }
}
