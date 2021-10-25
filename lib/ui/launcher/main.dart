import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_app/bloc/movies_bloc_observer.dart';
import 'package:movies_app/ui/launcher/movies_app.dart';
import 'package:shared/shared.dart';

void main() async {
  Bloc.observer = MoviesBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  Modular.init(SharedModule());
  return runApp(
    ModularApp(
      module: AppModule(),
      child: const MyApp(),
    ),
  );
}
