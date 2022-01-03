import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_details/cubit/movie_details_cubit.dart';
import 'package:movie_details/presentation/ui/movie_details_page.dart';
import 'package:movies_list/domain/usecases/movies_usecase.dart';
import 'package:shared/common/common.dart';

class FeatureMovieDetailsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((_) => MovieDetailsCubit(Modular.get<MoviesUseCase>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.get<NamedRoutes>().movieDetails +
              Modular.get<NamedRoutes>().movieDetailsIdParam,
          child: (context, args) =>
              MovieDetailsPage(movieId: int.parse(args.params["movieId"])),
        ),
      ];
}
