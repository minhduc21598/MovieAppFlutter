import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_world/constants/api_endpoint.dart';
import 'package:movie_world/constants/movie_type.dart';
import 'package:movie_world/constants/route_name.dart';
import 'package:movie_world/core/network_client.dart';
import 'package:movie_world/screens/all_list_movie/all_list_movie_param.dart';
import 'package:movie_world/screens/list_suggest_keyword/components/suggest_keyword_item.dart';
import 'package:movie_world/screens/list_suggest_keyword/models/suggest_keyword_model.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/utilities/theme_utilities.dart';
import 'package:movie_world/widgets/header_search_bar.dart';

class ListSuggestKeyword extends StatefulWidget {
  const ListSuggestKeyword({super.key});

  @override
  State<ListSuggestKeyword> createState() => _ListSuggestKeywordState();
}

class _ListSuggestKeywordState extends State<ListSuggestKeyword> {
  List<String> suggestKeywords = [];

  Future<void> getSuggestKeyword(String value) async {
    try {
      Response response = await NetworkClient.dio
          .get(ApiEndpoint.suggestKeyword, queryParameters: {'query': value});
      final listData = (response.data['results'] as List)
          .map((item) =>
              SuggestKeywordModel.fromJson(item as Map<String, dynamic>).name ??
              '')
          .toList();
      setState(() {
        suggestKeywords =
            listData.length < 6 ? listData : listData.sublist(0, 6);
      });
    } catch (e) {
      //
    }
  }

  void onChangeKeyWord(String value) {
    if (value != '') {
      getSuggestKeyword(value);
    } else {
      setState(() {
        suggestKeywords = [];
      });
    }
  }

  void onSubmitted(String value, BuildContext context) {
    final param =
        AllListMovieParam(movieType: MovieType.search, keywordSearch: value);
    context.push(RouteName.allListMovie, extra: param);
  }

  void onPressKeyword(String value, BuildContext context) {
    hideKeyboard(context);
    Future.delayed(const Duration(microseconds: 300), () {
      if (context.mounted) {
        onSubmitted(value, context);
      }
    });
  }

  void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: GestureDetector(
      onTap: () {
        hideKeyboard(context);
      },
      child: Column(
        children: [
          HeaderSearchBar(
            onChangeKeyWord: onChangeKeyWord,
            onSubmitted: (value) {
              onSubmitted(value, context);
            },
            autofocus: true,
          ),
          Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => SuggestKeywordItem(
                      onPressKeyword: () {
                        onPressKeyword(suggestKeywords[index], context);
                      },
                      content: suggestKeywords[index]),
                  separatorBuilder: (context, index) => Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.getScaleWidth(16)),
                        child: Divider(
                          thickness: 0.2,
                          color: ThemeUtilities.borderColor,
                        ),
                      ),
                  itemCount: suggestKeywords.length)),
        ],
      ),
    )));
  }
}
