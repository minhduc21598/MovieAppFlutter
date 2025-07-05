import 'package:flutter/cupertino.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/widgets/title_category/see_more_button.dart';

class TitleCategory extends StatelessWidget {
  final String title;
  final Function? onSeeMore;
  const TitleCategory({super.key, required this.title, this.onSeeMore});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Color(0xFF110E47),
              fontSize: SizeConfig.getScaleFontSize(16),
              fontWeight: FontWeight.bold),
        ),
        if (onSeeMore != null) SeeMoreButton(onSeeMore: onSeeMore!)
      ],
    );
  }
}
