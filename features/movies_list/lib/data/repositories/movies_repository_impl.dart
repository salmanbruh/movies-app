import 'package:movies_list/data/datasources/movies_data_source.dart';
import 'package:movies_list/data/models/movie_result_model.dart';
import 'package:movies_list/data/models/movies_list_result_model.dart';
import 'package:movies_list/domain/entities/movies_entity.dart';
import 'package:movies_list/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final MoviesDataSource moviesDataSource;

  MoviesRepositoryImpl({required this.moviesDataSource});

  @override
  Future<Map<String, dynamic>> getNowPlayingMovies(int page) async {
    MoviesListResultModel moviesResultModel =
        await moviesDataSource.getNowPlayingMovies(page);

    List<MovieEntity> movieEntities = _extractMovieEntities(moviesResultModel);

    return _apiCallResult(movieEntities, moviesResultModel.totalPages);
  }

  @override
  Future<Map<String, dynamic>> getPopularMovies(int page) async {
    MoviesListResultModel moviesResultModel =
        await moviesDataSource.getPopularMovies(page);

    List<MovieEntity> movieEntities = _extractMovieEntities(moviesResultModel);

    return _apiCallResult(movieEntities, moviesResultModel.totalPages);
  }

  @override
  Future<Map<String, dynamic>> getTopRatedMovies(int page) async {
    MoviesListResultModel moviesResultModel =
        await moviesDataSource.getTopRatedMovies(page);

    List<MovieEntity> movieEntities = _extractMovieEntities(moviesResultModel);

    return _apiCallResult(movieEntities, moviesResultModel.totalPages);
  }

  @override
  Future<Map<String, dynamic>> getUpcomingMovies(
    int page, {
    bool withTotalPage = false,
  }) async {
    MoviesListResultModel moviesResultModel =
        await moviesDataSource.getUpcomingMovies(page);

    List<MovieEntity> movieEntities = _extractMovieEntities(moviesResultModel);

    return _apiCallResult(movieEntities, moviesResultModel.totalPages);
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

  Map<String, dynamic> _apiCallResult(
      List<MovieEntity> movies, int totalPages) {
    return {
      "movies": movies,
      "totalPages": totalPages,
    };
  }

  @override
  Future<MovieEntity> getMovieDetails(int movieId) async {
    MovieResultModel movieResultModel =
        await moviesDataSource.getMovieDetails(movieId);
    MovieEntity movie = MovieEntity.fromMovieResultModel(movieResultModel);
    return movie;
  }
}
