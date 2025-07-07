import 'package:flutter/material.dart';
import 'package:movie_world/constants/language_key.dart';
import 'package:movie_world/gen/assets.gen.dart';
import 'package:movie_world/gen/strings.dart';
import 'package:movie_world/provider/language_provider.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/widgets/restart_app_widget.dart';
import 'package:movie_world/widgets/svg_show.dart';
import 'package:provider/provider.dart';

class ChooseLanguageItem extends StatelessWidget {
  const ChooseLanguageItem({super.key});

  @override
  Widget build(BuildContext context) {
    final Strings strings = Strings.of(context)!;
    final languageSave = context.read<LanguageProvider>().language;

    return ExpansionTile(
      title: Text(
        strings.language,
        style: TextStyle(
            fontSize: SizeConfig.getScaleFontSize(16),
            color: Color(0xFF000000)),
      ),
      leading: SvgShow(
        uri: Assets.icons.icLanguage,
      ),
      shape: Border.all(style: BorderStyle.none),
      children: [
        ListTile(
          title: Text(
            strings.english,
            style: TextStyle(
                fontSize: SizeConfig.getScaleFontSize(16),
                color: Color(0xFF000000)),
          ),
          horizontalTitleGap: SizeConfig.getScaleWidth(8),
          trailing: languageSave == LanguageKey.english
              ? SvgShow(
                  uri: Assets.icons.icCheck,
                  iconSize: SizeConfig.getScaleWidth(18),
                )
              : null,
          leading: SvgShow(
            uri: Assets.icons.icEn,
            iconSize: SizeConfig.getScaleWidth(18),
            noColorFilter: true,
          ),
          onTap: () {
            context.read<LanguageProvider>().saveLanguage(LanguageKey.english);
            Navigator.pop(context);
            RestartAppWidget.restartApp(context);
          },
        ),
        ListTile(
          title: Text(
            strings.vietnamese,
            style: TextStyle(
                fontSize: SizeConfig.getScaleFontSize(16),
                color: Color(0xFF000000)),
          ),
          horizontalTitleGap: SizeConfig.getScaleWidth(8),
          trailing: languageSave == LanguageKey.vietnamese
              ? SvgShow(
                  uri: Assets.icons.icCheck,
                  iconSize: SizeConfig.getScaleWidth(18),
                )
              : null,
          leading: SvgShow(
            uri: Assets.icons.icVi,
            iconSize: SizeConfig.getScaleWidth(18),
            noColorFilter: true,
          ),
          onTap: () {
            context
                .read<LanguageProvider>()
                .saveLanguage(LanguageKey.vietnamese);
            Navigator.pop(context);
            RestartAppWidget.restartApp(context);
          },
        )
      ],
    );
  }
}
