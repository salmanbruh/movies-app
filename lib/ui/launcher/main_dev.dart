import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_app/bloc/movies_bloc_observer.dart';
import 'package:movies_app/ui/launcher/app_config.dart';
import 'package:movies_app/ui/launcher/movies_app.dart';

void main() async {
  Bloc.observer = MoviesBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  final modularApp = ModularApp(
    module: AppModule(),
    child: const MyApp(),
  );
  final appConfig = AppConfig(
    appEnvironment: AppEnvironment.development,
    appName: "Movies Dev",
    description: "",
    baseUrl: "",
    themeData: ThemeData(),
    child: modularApp,
  );
  runApp(appConfig);
}
