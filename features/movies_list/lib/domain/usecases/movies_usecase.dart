import 'package:movies_list/domain/entities/movies_entity.dart';
import 'package:movies_list/domain/repositories/movies_repository.dart';

abstract class MoviesUseCase {
  Future<List<MoviesEntity>> getNowPlayingMovies();
  Future<List<MoviesEntity>> getPopularMovies();
  Future<List<MoviesEntity>> getTopRatedMovies();
  Future<List<MoviesEntity>> getUpcomingMovies();
}

class MoviesUseCaseImpl extends MoviesUseCase {
  final MoviesRepository moviesRepository;

  MoviesUseCaseImpl({required this.moviesRepository});

  @override
  Future<List<MoviesEntity>> getNowPlayingMovies() =>
      moviesRepository.getNowPlayingMovies();

  @override
  Future<List<MoviesEntity>> getPopularMovies() =>
      moviesRepository.getPopularMovies();

  @override
  Future<List<MoviesEntity>> getTopRatedMovies() =>
      moviesRepository.getTopRatedMovies();

  @override
  Future<List<MoviesEntity>> getUpcomingMovies() =>
      moviesRepository.getUpcomingMovies();
}
