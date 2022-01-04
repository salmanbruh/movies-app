import 'package:movies_list/data/datasources/movies_data_source.dart';
import 'package:movies_list/data/models/movie_result_model.dart';
import 'package:movies_list/data/models/movies_list_result_model.dart';
import 'package:movies_list/domain/entities/movies_entity.dart';
import 'package:movies_list/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final MoviesDataSource moviesDataSource;

  MoviesRepositoryImpl({required this.moviesDataSource});

  @override
  Future<List<dynamic>> getNowPlayingMovies(
    int page, {
    bool withTotalPage = false,
  }) async {
    MoviesListResultModel movies =
        await moviesDataSource.getNowPlayingMovies(page);

    List<MovieEntity> movieEntities = _extractMovieEntities(movies);

    return movieEntities;
  }

  @override
  Future<List<dynamic>> getPopularMovies(
    int page, {
    bool withTotalPage = false,
  }) async {
    MoviesListResultModel movies =
        await moviesDataSource.getPopularMovies(page);

    List<MovieEntity> movieEntities = _extractMovieEntities(movies);

    return movieEntities;
  }

  @override
  Future<List<dynamic>> getTopRatedMovies(
    int page, {
    bool withTotalPage = false,
  }) async {
    MoviesListResultModel movies =
        await moviesDataSource.getTopRatedMovies(page);

    List<MovieEntity> movieEntities = _extractMovieEntities(movies);

    return movieEntities;
  }

  @override
  Future<List<dynamic>> getUpcomingMovies(
    int page, {
    bool withTotalPage = false,
  }) async {
    MoviesListResultModel movies =
        await moviesDataSource.getUpcomingMovies(page);

    List<dynamic> movieEntities = _extractMovieEntities(movies);

    return movieEntities;
  }

  List<MovieEntity> _extractMovieEntities(
      MoviesListResultModel movieResultModel) {
    List<MovieEntity> movieEntities = [];

    for (var movieResultModel in movieResultModel.movies) {
      var movie = MovieEntity.fromMovieResultModel(movieResultModel);
      movieEntities.add(movie);
    }

    return movieEntities;
  }

  @override
  Future<MovieEntity> getMovieDetails(int movieId) async {
    MovieResultModel movieResultModel =
        await moviesDataSource.getMovieDetails(movieId);
    MovieEntity movie = MovieEntity.fromMovieResultModel(movieResultModel);
    return movie;
  }
}
