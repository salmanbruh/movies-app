import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_list/domain/usecases/movies_usecase.dart';
import 'package:movies_list/presentation/bloc/blocs.dart';
import 'package:movies_list/presentation/ui/movies_lists.dart';
import 'package:shared/common/common.dart';

class FeatureMoviesListModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((_) => AllNowPlayingMoviesListBloc(
            moviesUseCase: Modular.get<MoviesUseCase>())),
        Bind((_) => UpcomingMoviesListBloc(
            moviesUseCase: Modular.get<MoviesUseCase>())),
        Bind((_) =>
            PopularMoviesListBloc(moviesUseCase: Modular.get<MoviesUseCase>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.get<NamedRoutes>().moviesListNowPlaying,
          child: (context, args) => const NowPlayingAllListPage(),
        ),
        ChildRoute(
          Modular.get<NamedRoutes>().moviesListUpcoming,
          child: (context, args) => const UpcomingAllListPage(),
        ),
        ChildRoute(
          Modular.get<NamedRoutes>().moviesListPopular,
          child: (context, args) => const PopularAllListPage(),
        )
      ];
}
