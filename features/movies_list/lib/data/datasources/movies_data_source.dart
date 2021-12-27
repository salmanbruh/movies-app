import 'package:dio/dio.dart';
import 'package:core/network/dio_client.dart';
import 'package:movies_list/data/models/movie_model.dart';
import 'package:movies_list/data/models/movies_list_result_model.dart';
import 'package:shared/common/common.dart';

abstract class MoviesDataSource {
  Future<MoviesListResultModel> getNowPlayingMovies(int page);
  Future<MoviesListResultModel> getPopularMovies(int page);
  Future<MoviesListResultModel> getTopRatedMovies(int page);
  Future<MoviesListResultModel> getUpcomingMovies(int page);
  Future<MovieModel> getMovieDetails(int movieId);
}

class TmdbMoviesUrl {
  static String nowPlayingMovies = "/movie/now_playing";
  static String popularMovies = "/movie/popular";
  static String topRatedMovies = "/movie/top_rated";
  static String upcomingMovies = "/movie/upcoming";
  static String movieDetails = "/movie";
}

class TmdbApi extends MoviesDataSource {
  final DioClient dioClient;

  TmdbApi({required this.dioClient});

  @override
  Future<MoviesListResultModel> getNowPlayingMovies(int page) async {
    try {
      Response response = await dioClient.dio.get(
        TmdbMoviesUrl.nowPlayingMovies,
        queryParameters: {
          "api_key": Keys.tmdbKey,
          "page": page,
        },
      );
      return MoviesListResultModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  Future<MoviesListResultModel> getPopularMovies(int page) async {
    try {
      Response response = await dioClient.dio.get(
        TmdbMoviesUrl.popularMovies,
        queryParameters: {
          "api_key": Keys.tmdbKey,
          "page": page,
        },
      );
      return MoviesListResultModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  Future<MoviesListResultModel> getTopRatedMovies(int page) async {
    try {
      Response response = await dioClient.dio.get(
        TmdbMoviesUrl.topRatedMovies,
        queryParameters: {
          "api_key": Keys.tmdbKey,
          "page": page,
        },
      );
      return MoviesListResultModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  Future<MoviesListResultModel> getUpcomingMovies(int page) async {
    try {
      Response response = await dioClient.dio.get(
        TmdbMoviesUrl.upcomingMovies,
        queryParameters: {
          "api_key": Keys.tmdbKey,
          "page": page,
        },
      );
      return MoviesListResultModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  Future<MovieModel> getMovieDetails(int movieId) async {
    try {
      Response response = await dioClient.dio.get(
        TmdbMoviesUrl.movieDetails + "/$movieId",
        queryParameters: {
          "api_key": Keys.tmdbKey,
        },
      );

      return MovieModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }
}
