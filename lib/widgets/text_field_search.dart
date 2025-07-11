import 'package:flutter/material.dart';
import 'package:movie_world/gen/assets.gen.dart';
import 'package:movie_world/gen/strings.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/widgets/svg_show.dart';

class TextFieldSearch extends StatefulWidget {
  final Function? onChangeText;
  final Function? onSubmitted;
  final bool? enabled;
  final String? initialValue;
  final bool? autofocus;
  const TextFieldSearch({
    super.key,
    this.onChangeText,
    this.onSubmitted,
    this.enabled,
    this.initialValue,
    this.autofocus,
  });

  @override
  State<TextFieldSearch> createState() => _TextFieldSearchState();
}

class _TextFieldSearchState extends State<TextFieldSearch> {
  late final TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController(text: widget.initialValue);
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
    if (widget.onChangeText != null) {
      widget.onChangeText!('');
    }
  }

  void handleChange(value) {
    if (widget.onChangeText != null) {
      widget.onChangeText!(value);
    }
  }

  void handleSubmitted(value) {
    if (widget.onSubmitted != null && value.isNotEmpty) {
      FocusScope.of(context).unfocus();
      Future.delayed(const Duration(milliseconds: 300), () {
        widget.onSubmitted!(value);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Strings strings = Strings.of(context)!;

    return TextField(
      controller: textEditingController,
      onChanged: handleChange,
      onSubmitted: handleSubmitted,
      enabled: widget.enabled,
      style: TextStyle(
          fontSize: SizeConfig.getScaleFontSize(14), color: Colors.black),
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: SizeConfig.getScaleHeight(12)),
          prefixIcon: Padding(
            padding: EdgeInsets.all(SizeConfig.getScaleWidth(10)),
            child: SvgShow(
              uri: Assets.icons.icSearch,
            ),
          ),
          suffixIcon: textEditingController.text.isNotEmpty &&
                  (widget.enabled == null || (widget.enabled == true))
              ? Padding(
                  padding: EdgeInsets.all(SizeConfig.getScaleWidth(14)),
                  child: GestureDetector(
                    onTap: clearTextValue,
                    child: SvgShow(
                      uri: Assets.icons.icClose,
                      iconSize: SizeConfig.getScaleWidth(16),
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
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                SizeConfig.getScaleWidth(24),
              ),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(SizeConfig.getScaleWidth(24)),
              borderSide: BorderSide.none),
          fillColor: Colors.black12,
          filled: true,
          counterText: ''),
      maxLength: 100,
      maxLines: 1,
      autofocus: (widget.enabled == true || widget.enabled == null)
          ? (widget.autofocus ?? false)
          : false,
      cursorColor: Colors.black54,
    );
  }
}
