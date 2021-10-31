import 'package:core/core.dart';
import 'package:core/network/api_constants.dart';
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
    module: AppModule(
      baseUrl: ApiConstant.baseUrlProd,
    ),
    child: const MyApp(),
  );
  final appConfig = AppConfig(
    appEnvironment: AppEnvironment.production,
    appName: "Movies",
    description: "",
    baseUrl: ApiConstant.baseUrlProd,
    themeData: ThemeData(),
    app: modularApp,
  );
  runApp(appConfig);
}
