import 'package:movies_list/domain/entities/movies_entity.dart';
import 'package:movies_list/domain/repositories/movies_repository.dart';

abstract class MoviesUseCase {
  Future<Map<String, dynamic>> getNowPlayingMovies(int page);
  Future<Map<String, dynamic>> getPopularMovies(int page);
  Future<Map<String, dynamic>> getTopRatedMovies(int page);
  Future<Map<String, dynamic>> getUpcomingMovies(int page);
  Future<MovieEntity> getMovieDetails(int movieId);
  Future<Map<String, dynamic>> searchMovie(String query, int page);
}

class MoviesUseCaseImpl extends MoviesUseCase {
  final MoviesRepository moviesRepository;

  MoviesUseCaseImpl({required this.moviesRepository});

  @override
  Future<Map<String, dynamic>> getNowPlayingMovies(int page) async =>
      await moviesRepository.getNowPlayingMovies(page);

  @override
  Future<Map<String, dynamic>> getPopularMovies(int page) async =>
      moviesRepository.getPopularMovies(page);

  @override
  Future<Map<String, dynamic>> getTopRatedMovies(int page) =>
      moviesRepository.getTopRatedMovies(page);

  @override
  Future<Map<String, dynamic>> getUpcomingMovies(int page) =>
      moviesRepository.getUpcomingMovies(page);

  @override
  Future<MovieEntity> getMovieDetails(int movieId) =>
      moviesRepository.getMovieDetails(movieId);

  @override
  Future<Map<String, dynamic>> searchMovie(String query, int page) =>
      moviesRepository.searchMovie(query, page);
}
