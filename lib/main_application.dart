import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:movie_world/constants/language_key.dart';
import 'package:movie_world/constants/local_storage_key.dart';
import 'package:movie_world/core/network_client.dart';
import 'package:movie_world/gen/strings.dart';
import 'package:movie_world/main_router.dart';
import 'package:movie_world/provider/language_provider.dart';
import 'package:movie_world/utilities/local_storage_utilities.dart';
import 'package:movie_world/utilities/size_config_utitilites.dart';
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
    configNetworkClient();
    hideSplashScreen();
  }

  void hideSplashScreen() async {
    await Future.delayed(const Duration(milliseconds: 500), () {
      FlutterNativeSplash.remove();
    });
  }

  void configNetworkClient() {
    final languageFromLocal = LocalStorage.getString(LocalStorageKey.language);
    NetworkClient.createClient(languageFromLocal ?? LanguageKey.english);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final languageFromLocal = LocalStorage.getString(LocalStorageKey.language);

    return MultiProvider(
      providers: [
        Provider(
          create: (_) {
            final languageProvider = LanguageProvider();
            languageProvider
                .saveLanguage(languageFromLocal ?? LanguageKey.english);
            return languageProvider;
          },
        ),
      ],
      child: MaterialApp.router(
        locale: Locale(languageFromLocal ?? LanguageKey.english),
        localizationsDelegates: Strings.localizationsDelegates,
        supportedLocales: Strings.supportedLocales,
        routerConfig: MainRouter.build(),
      ),
    );
  }
}
