import 'package:movies_list/domain/entities/movies_entity.dart';

abstract class MoviesRepository {
  Future<List<MovieEntity>> getNowPlayingMovies(int page);
  Future<List<MovieEntity>> getPopularMovies();
  Future<List<MovieEntity>> getTopRatedMovies();
  Future<List<MovieEntity>> getUpcomingMovies();
}
