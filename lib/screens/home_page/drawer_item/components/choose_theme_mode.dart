import 'package:flutter/material.dart';
import 'package:movie_world/constants/local_storage_key.dart';
import 'package:movie_world/constants/theme_mode_key.dart';
import 'package:movie_world/gen/assets.gen.dart';
import 'package:movie_world/gen/strings.dart';
import 'package:movie_world/main_controller.dart';
import 'package:movie_world/utilities/local_storage_utilities.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/utilities/theme_utilities.dart';
import 'package:movie_world/widgets/svg_show.dart';
import 'package:provider/provider.dart';

class ChooseThemeMode extends StatelessWidget {
  const ChooseThemeMode({super.key});

  @override
  Widget build(BuildContext context) {
    final Strings strings = Strings.of(context)!;
    final MainController controller = context.read();

    Future<void> onChangeTheme(String themeMode) async {
      controller.saveThemeMode(
          themeMode == ThemeModeKey.dark ? ThemeMode.dark : ThemeMode.light);
      await LocalStorage.setValue(LocalStorageKey.themeMode, themeMode);
      if (context.mounted) Navigator.pop(context);
    }

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
            onChangeTheme(ThemeModeKey.dark);
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
            onChangeTheme(ThemeModeKey.light);
          },
        )
      ],
    );
  }
}
