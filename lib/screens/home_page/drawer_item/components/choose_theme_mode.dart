import 'package:flutter/material.dart';
import 'package:movie_world/gen/assets.gen.dart';
import 'package:movie_world/gen/strings.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/utilities/theme_utilities.dart';
import 'package:movie_world/widgets/svg_show.dart';

class ChooseThemeMode extends StatelessWidget {
  const ChooseThemeMode({super.key});

  @override
  Widget build(BuildContext context) {
    final Strings strings = Strings.of(context)!;

    return ExpansionTile(
      title: Text(
        strings.dark_mode,
        style: TextStyle(
            fontSize: SizeConfig.getScaleFontSize(16),
            color: ThemeUtilities.primaryTextColor),
      ),
      leading: SvgShow(
        uri: Assets.icons.icThemeMode,
      ),
      shape: Border.all(style: BorderStyle.none),
      children: [
        ListTile(
          title: Text(
            strings.on,
            style: TextStyle(
                fontSize: SizeConfig.getScaleFontSize(16),
                color: ThemeUtilities.primaryTextColor),
          ),
          horizontalTitleGap: SizeConfig.getScaleWidth(8),
          trailing: SvgShow(
            uri: ThemeUtilities.themeMode == ThemeMode.dark
                ? Assets.icons.icRadioChecked
                : Assets.icons.icRadioUnchecked,
            iconSize: SizeConfig.getScaleWidth(18),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text(
            strings.off,
            style: TextStyle(
                fontSize: SizeConfig.getScaleFontSize(16),
                color: ThemeUtilities.primaryTextColor),
          ),
          horizontalTitleGap: SizeConfig.getScaleWidth(8),
          trailing: SvgShow(
            uri: ThemeUtilities.themeMode == ThemeMode.light
                ? Assets.icons.icRadioChecked
                : Assets.icons.icRadioUnchecked,
            iconSize: SizeConfig.getScaleWidth(18),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
