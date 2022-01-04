import 'package:core/network/dio_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home/home.dart';
import 'package:movie_details/movie_details.dart';
import 'package:movies_app/ui/launcher/app_config.dart';
import 'package:movies_app/ui/splash/splash_page.dart';
import 'package:movies_list/data/datasources/movies_data_source.dart';
import 'package:movies_list/data/repositories/movies_repository_impl.dart';
import 'package:movies_list/domain/repositories/movies_repository.dart';
import 'package:movies_list/domain/usecases/movies_usecase.dart';
import 'package:movies_list/movies_list.dart';
import 'package:shared/common/common.dart';

class AppModule extends Module {
  final String baseUrl;

  AppModule({required this.baseUrl});

  @override
  List<Bind> get binds => [
        Bind((_) => ColorPalettes()),
        Bind((_) => NamedRoutes()),
        Bind((_) => DioClient(baseUrl: baseUrl)),
        Bind((_) => TmdbApi(dioClient: Modular.get<DioClient>())),
        Bind((_) => MoviesRepositoryImpl(
            moviesDataSource: Modular.get<MoviesDataSource>())),
        Bind((_) => MoviesUseCaseImpl(
            moviesRepository: Modular.get<MoviesRepository>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.get<NamedRoutes>().splashPage,
          child: (context, args) => const SplashPage(),
        ),
        ModuleRoute(
          Modular.get<NamedRoutes>().root,
          module: FeatureHomeModule(),
        ),
        ModuleRoute(
          Modular.get<NamedRoutes>().root,
          module: FeatureMovieDetailsModule(),
        ),
        ModuleRoute(
          Modular.get<NamedRoutes>().moviesList,
          module: FeatureMoviesListModule(),
        )
      ];
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return Material(
          child: child,
        );
      },
      title: "Movies App",
      initialRoute: Modular.get<NamedRoutes>().splashPage,
      theme: theme,
      debugShowCheckedModeBanner:
          AppConfig.of(context).appEnvironment == AppEnvironment.development
              ? true
              : false,
    ).modular();
  }
}
