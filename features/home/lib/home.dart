import 'package:flutter_modular/flutter_modular.dart';
import 'package:home/presentation/ui/home_page.dart';
import 'package:movies_list/domain/usecases/movies_usecase.dart';
import 'package:movies_list/presentation/bloc/blocs.dart';
import 'package:shared/common/common.dart';

class FeatureHomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((_) =>
            NowPlayingMoviesBloc(moviesUseCase: Modular.get<MoviesUseCase>())),
        Bind((_) =>
            UpcomingMoviesBloc(moviesUseCase: Modular.get<MoviesUseCase>())),
        Bind((_) =>
            PopularMoviesBloc(moviesUseCase: Modular.get<MoviesUseCase>())),
        Bind((_) =>
            TopRatedMoviesBloc(moviesUseCase: Modular.get<MoviesUseCase>()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.get<NamedRoutes>().root,
          child: (context, arg) => const HomePage(),
        ),
      ];
}
