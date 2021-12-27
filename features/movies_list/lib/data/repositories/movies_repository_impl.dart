import 'package:movies_list/data/datasources/movies_data_source.dart';
import 'package:movies_list/data/models/movie_model.dart';
import 'package:movies_list/data/models/movies_list_result_model.dart';
import 'package:movies_list/domain/entities/movies_entity.dart';
import 'package:movies_list/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final MoviesDataSource moviesDataSource;

  MoviesRepositoryImpl({required this.moviesDataSource});

  @override
  Future<List<MovieEntity>> getNowPlayingMovies(int page) async {
    MoviesListResultModel movies =
        await moviesDataSource.getNowPlayingMovies(page);

    List<MovieEntity> movieEntities = _extractMovieEntities(movies);

    return movieEntities;
  }

  @override
  Future<List<MovieEntity>> getPopularMovies(int page) async {
    MoviesListResultModel movies =
        await moviesDataSource.getPopularMovies(page);

    List<MovieEntity> movieEntities = _extractMovieEntities(movies);

    return movieEntities;
  }

  @override
  Future<List<MovieEntity>> getTopRatedMovies(int page) async {
    MoviesListResultModel movies =
        await moviesDataSource.getTopRatedMovies(page);

    List<MovieEntity> movieEntities = _extractMovieEntities(movies);

    return movieEntities;
  }

  @override
  Future<List<MovieEntity>> getUpcomingMovies(int page) async {
    MoviesListResultModel movies =
        await moviesDataSource.getUpcomingMovies(page);

    List<MovieEntity> movieEntities = _extractMovieEntities(movies);

    return movieEntities;
  }

  List<MovieEntity> _extractMovieEntities(
      MoviesListResultModel movieResultModel) {
    List<MovieEntity> movieEntities = [];

    for (var data in movieResultModel.movies) {
      var movie = MovieEntity(
        id: data.id,
        genres: data.genres,
        title: data.title,
        overview: data.overview,
        posterPath: data.posterPath,
        releaseDate: data.releaseDate,
        runtime: data.runtime,
        voteAverage: data.voteAverage,
      );
      movieEntities.add(movie);
    }

    return movieEntities;
  }

  @override
  Future<MovieEntity> getMovieDetails(int movieId) async {
    MovieModel movieDetailsResult =
        await moviesDataSource.getMovieDetails(movieId);
    MovieEntity movie = MovieEntity(
      id: movieDetailsResult.id,
      genres: movieDetailsResult.genres,
      title: movieDetailsResult.title,
      overview: movieDetailsResult.overview,
      posterPath: movieDetailsResult.posterPath,
      releaseDate: movieDetailsResult.releaseDate,
      runtime: movieDetailsResult.runtime,
      voteAverage: movieDetailsResult.voteAverage,
    );
    return movie;
  }
}
