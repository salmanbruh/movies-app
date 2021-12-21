import 'package:dio/dio.dart';
import 'package:core/network/dio_client.dart';
import 'package:movies_list/data/models/movie_result_model.dart';
import 'package:shared/common/common.dart';

abstract class MoviesDataSource {
  Future<MovieResultModel> getNowPlayingMovies(int page);
  Future<MovieResultModel> getPopularMovies(int page);
  Future<MovieResultModel> getTopRatedMovies(int page);
  Future<MovieResultModel> getUpcomingMovies(int page);
}

class TmdbMoviesUrl {
  static String nowPlayingMovies = "/movie/now_playing";
  static String popularMovies = "/movie/popular";
  static String topRatedMovies = "/movie/top_rated";
  static String upcomingMovies = "/movie/upcoming";
}

class TmdbApi extends MoviesDataSource {
  final DioClient dioClient;

  TmdbApi({required this.dioClient});

  @override
  Future<MovieResultModel> getNowPlayingMovies(int page) async {
    try {
      Response response = await dioClient.dio.get(
        TmdbMoviesUrl.nowPlayingMovies,
        queryParameters: {
          "api_key": Keys.tmdbKey,
          "page": page,
        },
      );
      return MovieResultModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  Future<MovieResultModel> getPopularMovies(int page) async {
    try {
      Response response = await dioClient.dio.get(
        TmdbMoviesUrl.popularMovies,
        queryParameters: {
          "api_key": Keys.tmdbKey,
          "page": page,
        },
      );
      return MovieResultModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  Future<MovieResultModel> getTopRatedMovies(int page) async {
    try {
      Response response = await dioClient.dio.get(
        TmdbMoviesUrl.topRatedMovies,
        queryParameters: {
          "api_key": Keys.tmdbKey,
          "page": page,
        },
      );
      return MovieResultModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  Future<MovieResultModel> getUpcomingMovies(int page) async {
    try {
      Response response = await dioClient.dio.get(
        TmdbMoviesUrl.upcomingMovies,
        queryParameters: {
          "api_key": Keys.tmdbKey,
          "page": page,
        },
      );
      return MovieResultModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }
}
