import 'package:movies_list/domain/entities/movies_entity.dart';

abstract class MoviesRepository {
  Future<List<MovieEntity>> getNowPlayingMovies(int page);
  Future<List<MovieEntity>> getPopularMovies(int page);
  Future<List<MovieEntity>> getTopRatedMovies(int page);
  Future<List<MovieEntity>> getUpcomingMovies(int page);
}
