import 'package:flutter/material.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/widgets/back_closing_button.dart';

class ScreenCommonAppBar extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? drawerItem;
  final Widget? floatingActionButton;
  final bool? noAppBar;
  final List<Widget>? appBarActions;

  const ScreenCommonAppBar(
      {super.key,
      required this.title,
      required this.child,
      this.drawerItem,
      this.floatingActionButton,
      this.appBarActions,
      this.noAppBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: noAppBar == true
          ? null
          : AppBar(
              title: Text(title),
              centerTitle: true,
              actions: appBarActions,
              actionsPadding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.getScaleWidth(16)),
              leading: drawerItem == null
                  ? Padding(
                      padding: EdgeInsets.all(SizeConfig.getScaleWidth(12)),
                      child: BackClosingButton(),
                    )
                  : null,
              automaticallyImplyLeading: drawerItem != null,
            ),
      body: SafeArea(child: child),
      drawer: drawerItem,
      floatingActionButton: floatingActionButton,
    );
  }
}
