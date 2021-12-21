import 'package:movies_list/data/datasources/movies_data_source.dart';
import 'package:movies_list/data/models/movie_result_model.dart';
import 'package:movies_list/domain/entities/movies_entity.dart';
import 'package:movies_list/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final MoviesDataSource moviesDataSource;

  MoviesRepositoryImpl({required this.moviesDataSource});

  @override
  Future<List<MovieEntity>> getNowPlayingMovies(int page) async {
    List<MovieEntity> movieEntities = [];

    MovieResultModel movies = await moviesDataSource.getNowPlayingMovies(page);

    for (var data in movies.movies) {
      var movie = MovieEntity(
        genres: data.genres ?? "",
        title: data.title,
        overview: data.overview,
        posterPath: data.posterPath,
        releaseDate: data.releaseDate,
        runtime: data.runtime ?? "",
        voteAverage: data.voteAverage,
      );
      movieEntities.add(movie);
    }

    return movieEntities;
  }

  @override
  Future<List<MovieEntity>> getPopularMovies() {
    // TODO: implement getPopularMovies
    throw UnimplementedError();
  }

  @override
  Future<List<MovieEntity>> getTopRatedMovies() {
    // TODO: implement getTopRatedMovies
    throw UnimplementedError();
  }

  @override
  Future<List<MovieEntity>> getUpcomingMovies() {
    // TODO: implement getUpcomingMovies
    throw UnimplementedError();
  }
}
