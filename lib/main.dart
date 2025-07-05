import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:movie_world/main_application.dart';
import 'package:movie_world/utilities/local_storage_utilities.dart';
import 'package:movie_world/widgets/restart_app_widget.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await LocalStorage.init();
  runApp(RestartAppWidget(child: const MainApplication()));
}
