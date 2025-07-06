import 'package:flutter/material.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/widgets/back_closing_button.dart';
import 'package:movie_world/widgets/text_field_search.dart';

class HeaderSearchBar extends StatelessWidget {
  final Function? onChangeKeyWord;
  const HeaderSearchBar({super.key, this.onChangeKeyWord});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      padding: EdgeInsets.only(
          top: SizeConfig.getScaleHeight(12),
          bottom: SizeConfig.getScaleHeight(12),
          right: SizeConfig.getScaleWidth(16),
          left: SizeConfig.getScaleWidth(8)),
      child: Row(
        spacing: SizeConfig.getScaleWidth(12),
        children: [
          BackClosingButton(),
          Expanded(child: TextFieldSearch(onChangeText: onChangeKeyWord))
        ],
      ),
    );
  }
}
