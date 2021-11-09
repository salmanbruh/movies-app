import 'package:movies_list/domain/entities/movies_entity.dart';

abstract class MoviesRepository {
  Future<List<MoviesEntity>> getNowPlayingMovies();
  Future<List<MoviesEntity>> getPopularMovies();
  Future<List<MoviesEntity>> getTopRatedMovies();
  Future<List<MoviesEntity>> getUpcomingMovies();
}
