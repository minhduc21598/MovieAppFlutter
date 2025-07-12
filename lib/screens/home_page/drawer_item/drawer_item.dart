import 'package:flutter/material.dart';
import 'package:movie_world/screens/home_page/drawer_item/components/choose_language_item/choose_language_item.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/utilities/theme_utilities.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (SizeConfig.screenWidth * 2) / 3,
      height: SizeConfig.screenHeight,
      color: ThemeUtilities.scaffoldBackground,
      child: SafeArea(
          child: Column(
        children: [ChooseLanguageItem()],
      )),
    );
  }
}
