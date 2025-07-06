import 'package:flutter/material.dart';
import 'package:movie_world/gen/assets.gen.dart';
import 'package:movie_world/gen/strings.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/widgets/svg_show.dart';

class TextFieldSearch extends StatefulWidget {
  const TextFieldSearch({super.key});

  @override
  State<TextFieldSearch> createState() => _TextFieldSearchState();
}

class _TextFieldSearchState extends State<TextFieldSearch> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  void clearTextValue() {
    textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final Strings strings = Strings.of(context)!;

    return TextField(
      controller: textEditingController,
      style: TextStyle(
          fontSize: SizeConfig.getScaleFontSize(14), color: Colors.black87),
      decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.all(SizeConfig.getScaleWidth(10)),
            child: SvgShow(
              uri: Assets.icons.icSearch,
            ),
          ),
          suffixIcon: textEditingController.text.isNotEmpty
              ? Padding(
                  padding: EdgeInsets.all(SizeConfig.getScaleWidth(16)),
                  child: GestureDetector(
                    onTap: clearTextValue,
                    child: SvgShow(
                      uri: Assets.icons.icClose,
                      iconSize: SizeConfig.getScaleWidth(18),
                      color: Colors.black38,
                    ),
                  ),
                )
              : null,
          hintText: strings.enter_movie_name,
          hintStyle: TextStyle(
              fontSize: SizeConfig.getScaleFontSize(14), color: Colors.black54),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                SizeConfig.getScaleWidth(24),
              ),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(SizeConfig.getScaleWidth(24)),
              borderSide: BorderSide.none),
          fillColor: Colors.grey[200],
          filled: true,
          counterText: ''),
      maxLength: 100,
      maxLines: 1,
      autofocus: true,
      cursorColor: Colors.black54,
    );
  }
}
