import 'package:flutter/material.dart';
import 'package:movie_world/constants/language_key.dart';
import 'package:movie_world/constants/local_storage_key.dart';
import 'package:movie_world/main_application.dart';
import 'package:movie_world/provider/language_provider.dart';
import 'package:movie_world/utilities/local_storage_utilities.dart';
import 'package:provider/provider.dart';

class ProviderConfig extends StatelessWidget {
  const ProviderConfig({super.key});

  @override
  Widget build(BuildContext context) {
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
      ],
      child: const MainApplication(),
    );
  }
}
