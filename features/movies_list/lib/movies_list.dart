import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_list/domain/usecases/movies_usecase.dart';
import 'package:movies_list/presentation/bloc/view_all_lists/all_now_playing_movies_list_bloc.dart';
import 'package:movies_list/presentation/ui/view_all_lists/now_playing_all_list_page.dart';
import 'package:shared/common/common.dart';

class FeatureMoviesListModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((_) => AllNowPlayingMoviesListBloc(
            moviesUseCase: Modular.get<MoviesUseCase>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.get<NamedRoutes>().moviesListNowPlaying,
          child: (context, args) => const NowPlayingAllListPage(),
        ),
      ];
}
