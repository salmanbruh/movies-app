import 'package:movies_list/domain/entities/movies_entity.dart';

abstract class MoviesRepository {
  Future<List<dynamic>> getNowPlayingMovies(int page);
  Future<List<dynamic>> getPopularMovies(int page);
  Future<List<dynamic>> getTopRatedMovies(int page);
  Future<List<dynamic>> getUpcomingMovies(int page);
  Future<MovieEntity> getMovieDetails(int movieId);
}
