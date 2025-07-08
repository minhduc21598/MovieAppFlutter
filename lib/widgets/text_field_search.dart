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
  const TextFieldSearch({
    super.key,
    this.onChangeText,
    this.onSubmitted,
    this.enabled,
    this.initialValue,
  });

  @override
  State<TextFieldSearch> createState() => _TextFieldSearchState();
}

class _TextFieldSearchState extends State<TextFieldSearch> {
  late final TextEditingController textEditingController;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController(text: widget.initialValue);
    textEditingController.addListener(() {
      setState(() {});
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
    textEditingController.dispose();
  }

  void clearTextValue() {
    textEditingController.clear();
    if (widget.onChangeText != null) {
      widget.onChangeText!('');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Strings strings = Strings.of(context)!;

    return TextField(
      controller: textEditingController,
      focusNode: _focusNode,
      onChanged: (value) {
        if (widget.onChangeText != null) {
          widget.onChangeText!(value);
        }
      },
      onSubmitted: (value) {
        if (widget.onSubmitted != null && value.isNotEmpty) {
          widget.onSubmitted!(value);
        }
      },
      enabled: widget.enabled,
      style: TextStyle(
          fontSize: SizeConfig.getScaleFontSize(14), color: Colors.black),
      decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.all(SizeConfig.getScaleWidth(10)),
            child: SvgShow(
              uri: Assets.icons.icSearch,
            ),
          ),
          suffixIcon: textEditingController.text.isNotEmpty &&
                  (widget.enabled == null ||
                      (widget.enabled != null && widget.enabled!))
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
      autofocus: false,
      cursorColor: Colors.black54,
    );
  }
}
