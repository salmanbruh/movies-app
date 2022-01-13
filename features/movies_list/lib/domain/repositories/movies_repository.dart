import 'package:movies_list/domain/entities/movies_entity.dart';

abstract class MoviesRepository {
  Future<Map<String, dynamic>> getNowPlayingMovies(int page);
  Future<Map<String, dynamic>> getPopularMovies(int page);
  Future<Map<String, dynamic>> getTopRatedMovies(int page);
  Future<Map<String, dynamic>> getUpcomingMovies(int page);
  Future<MovieEntity> getMovieDetails(int movieId);
  Future<Map<String, dynamic>> searchMovie(String query, int page);
}
