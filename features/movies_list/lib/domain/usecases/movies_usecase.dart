import 'package:movies_list/domain/entities/movies_entity.dart';
import 'package:movies_list/domain/repositories/movies_repository.dart';

abstract class MoviesUseCase {
  Future<List<MovieEntity>> getNowPlayingMovies(int page);
  Future<List<MovieEntity>> getPopularMovies();
  Future<List<MovieEntity>> getTopRatedMovies();
  Future<List<MovieEntity>> getUpcomingMovies();
}

class MoviesUseCaseImpl extends MoviesUseCase {
  final MoviesRepository moviesRepository;

  MoviesUseCaseImpl({required this.moviesRepository});

  @override
  Future<List<MovieEntity>> getNowPlayingMovies(int page) async =>
      await moviesRepository.getNowPlayingMovies(page);

  @override
  Future<List<MovieEntity>> getPopularMovies() =>
      moviesRepository.getPopularMovies();

  @override
  Future<List<MovieEntity>> getTopRatedMovies() =>
      moviesRepository.getTopRatedMovies();

  @override
  Future<List<MovieEntity>> getUpcomingMovies() =>
      moviesRepository.getUpcomingMovies();
}
