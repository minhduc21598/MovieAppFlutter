import 'package:movie_world/constants/language_key.dart';
import 'package:movie_world/constants/local_storage_key.dart';
import 'package:movie_world/utilities/local_storage_utilities.dart';

class LanguageProvider {
  String _language = LanguageKey.english;

  static final LanguageProvider _singleton = LanguageProvider._internal();

  factory LanguageProvider() {
    return _singleton;
  }

  LanguageProvider._internal();

  String get language => _language;

  Future<void> _saveToLocal(String lang) async {
    await LocalStorage.setValue(LocalStorageKey.language, lang);
  }

  void saveLanguage(String lang) {
    _language = lang;
    _saveToLocal(lang);
  }
}
