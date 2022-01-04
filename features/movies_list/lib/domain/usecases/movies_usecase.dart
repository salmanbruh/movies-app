import 'package:movies_list/domain/entities/movies_entity.dart';
import 'package:movies_list/domain/repositories/movies_repository.dart';

abstract class MoviesUseCase {
  Future<List<dynamic>> getNowPlayingMovies(int page);
  Future<List<dynamic>> getPopularMovies(int page);
  Future<List<dynamic>> getTopRatedMovies(int page);
  Future<List<dynamic>> getUpcomingMovies(int page);
  Future<MovieEntity> getMovieDetails(int movieId);
}

class MoviesUseCaseImpl extends MoviesUseCase {
  final MoviesRepository moviesRepository;

  MoviesUseCaseImpl({required this.moviesRepository});

  @override
  Future<List<dynamic>> getNowPlayingMovies(int page) async =>
      await moviesRepository.getNowPlayingMovies(page);

  @override
  Future<List<dynamic>> getPopularMovies(int page) async =>
      moviesRepository.getPopularMovies(page);

  @override
  Future<List<dynamic>> getTopRatedMovies(int page) =>
      moviesRepository.getTopRatedMovies(page);

  @override
  Future<List<dynamic>> getUpcomingMovies(int page) =>
      moviesRepository.getUpcomingMovies(page);

  @override
  Future<MovieEntity> getMovieDetails(int movieId) =>
      moviesRepository.getMovieDetails(movieId);
}
