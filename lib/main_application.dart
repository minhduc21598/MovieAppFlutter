import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:movie_world/constants/language_key.dart';
import 'package:movie_world/constants/local_storage_key.dart';
import 'package:movie_world/constants/theme_mode_key.dart';
import 'package:movie_world/core/network_client.dart';
import 'package:movie_world/gen/strings.dart';
import 'package:movie_world/main_controller.dart';
import 'package:movie_world/main_router.dart';
import 'package:movie_world/provider/language_provider.dart';
import 'package:movie_world/utilities/local_storage_utilities.dart';
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
    initData();
  }

  void initData() {
    NetworkClient.createClient();
    initThemeMode();
    hideSplashScreen();
  }

  void initThemeMode() {
    final themeModeFromLocal =
        LocalStorage.getString(LocalStorageKey.themeMode);
    ThemeUtilities.themeMode = themeModeFromLocal == ThemeModeKey.dark
        ? ThemeMode.dark
        : ThemeMode.light;
  }

  void hideSplashScreen() async {
    await Future.delayed(const Duration(milliseconds: 500), () {
      FlutterNativeSplash.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    final routerConfig = MainRouter();
    final languageFromLocal = LocalStorage.getString(LocalStorageKey.language);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            final languageProvider = LanguageProvider();
            languageProvider
                .saveLanguage(languageFromLocal ?? LanguageKey.english);
            return languageProvider;
          },
        ),
        ChangeNotifierProvider(
          create: (_) => MainController(),
        ),
      ],
      builder: (context, child) {
        final MainController controller = context.watch();
        final language = context.watch<LanguageProvider>().language;

        return !controller.isLoading
            ? MaterialApp.router(
                locale: Locale(language),
                localizationsDelegates: Strings.localizationsDelegates,
                supportedLocales: Strings.supportedLocales,
                routerConfig: routerConfig.router,
                theme: ThemeUtilities.createTheme(Brightness.light),
                darkTheme: ThemeUtilities.createTheme(Brightness.dark),
                themeMode: ThemeUtilities.themeMode,
              )
            : Container();
      },
    );
  }
}
