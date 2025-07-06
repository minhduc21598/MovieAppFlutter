import 'package:flutter/material.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/widgets/back_closing_button.dart';

class ScreenCommonAppBar extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? drawerItem;
  final Widget? floatingActionButton;
  final Widget? flexibleSpace;
  final List<Widget>? appBarActions;
  final bool? noBackButton;

  const ScreenCommonAppBar(
      {super.key,
      required this.title,
      required this.child,
      this.drawerItem,
      this.floatingActionButton,
      this.appBarActions,
      this.noBackButton,
      this.flexibleSpace});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: TextStyle(
              fontSize: SizeConfig.getScaleFontSize(16),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: appBarActions,
        flexibleSpace: flexibleSpace,
        actionsPadding:
            EdgeInsets.symmetric(horizontal: SizeConfig.getScaleWidth(16)),
        leading: drawerItem == null &&
                ((noBackButton != null && !noBackButton!) ||
                    noBackButton == null)
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
