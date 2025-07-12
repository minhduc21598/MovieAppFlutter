import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:movie_world/core/network_client.dart';
import 'package:movie_world/gen/strings.dart';
import 'package:movie_world/main_router.dart';
import 'package:movie_world/provider/language_provider.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
import 'package:movie_world/utilities/theme_utilities.dart';
import 'package:provider/provider.dart';

class MainApplication extends StatefulWidget {
  const MainApplication({super.key});

  @override
  State<MainApplication> createState() => _MainApplicationState();
}

class _MainApplicationState extends State<MainApplication> {
  @override
  void initState() {
    super.initState();
    NetworkClient.createClient();
    hideSplashScreen();
  }

  void hideSplashScreen() async {
    await Future.delayed(const Duration(milliseconds: 500), () {
      FlutterNativeSplash.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    final routerConfig = MainRouter();
    final language = context.watch<LanguageProvider>().language;
    SizeConfig.init(context);

    return MaterialApp.router(
      locale: Locale(language),
      localizationsDelegates: Strings.localizationsDelegates,
      supportedLocales: Strings.supportedLocales,
      routerConfig: routerConfig.router,
      theme: ThemeUtilities.createTheme(Brightness.light),
      darkTheme: ThemeUtilities.createTheme(Brightness.dark),
      themeMode: ThemeUtilities.themeMode,
    );
  }
}
