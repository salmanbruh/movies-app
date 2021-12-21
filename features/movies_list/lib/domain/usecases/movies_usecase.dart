import 'package:movies_list/domain/entities/movies_entity.dart';
import 'package:movies_list/domain/repositories/movies_repository.dart';

abstract class MoviesUseCase {
  Future<List<MovieEntity>> getNowPlayingMovies(int page);
  Future<List<MovieEntity>> getPopularMovies(int page);
  Future<List<MovieEntity>> getTopRatedMovies(int page);
  Future<List<MovieEntity>> getUpcomingMovies(int page);
}

class MoviesUseCaseImpl extends MoviesUseCase {
  final MoviesRepository moviesRepository;

  MoviesUseCaseImpl({required this.moviesRepository});

  @override
  Future<List<MovieEntity>> getNowPlayingMovies(int page) async =>
      await moviesRepository.getNowPlayingMovies(page);

  @override
  Future<List<MovieEntity>> getPopularMovies(int page) async =>
      moviesRepository.getPopularMovies(page);

  @override
  Future<List<MovieEntity>> getTopRatedMovies(int page) =>
      moviesRepository.getTopRatedMovies(page);

  @override
  Future<List<MovieEntity>> getUpcomingMovies(int page) =>
      moviesRepository.getUpcomingMovies(page);
}
