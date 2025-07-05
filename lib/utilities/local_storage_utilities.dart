import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late final SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setValue<T>(String key, T? val) {
    if (val is bool) {
      return _prefs.setBool(key, val);
    }
    if (val is double) {
      return _prefs.setDouble(key, val);
    }
    if (val is int) {
      return _prefs.setInt(key, val);
    }
    if (val is String) {
      return _prefs.setString(key, val);
    }
    if (val is List<String>) {
      return _prefs.setStringList(key, val);
    }
    throw Exception('Type not supported!');
  }

  static bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  static double? getDouble(String key) {
    return _prefs.getDouble(key);
  }

  static int? getInt(String key) {
    return _prefs.getInt(key);
  }

  static String? getString(String key) {
    return _prefs.getString(key);
  }

  static List<String>? getStringList(String key) {
    return _prefs.getStringList(key);
  }
}
