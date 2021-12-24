import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_details/presentation/ui/movie_details.dart';
import 'package:shared/common/common.dart';

class FeatureMovieDetailsModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.get<NamedRoutes>().movieDetails +
              Modular.get<NamedRoutes>().movieDetailsIdParam,
          child: (context, args) =>
              MovieDetails(movieId: int.parse(args.params["movieId"])),
        ),
      ];
}
