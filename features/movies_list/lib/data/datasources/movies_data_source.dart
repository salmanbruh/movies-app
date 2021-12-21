import 'package:dio/dio.dart';
import 'package:core/network/dio_client.dart';
import 'package:movies_list/data/models/movie_result_model.dart';
import 'package:shared/common/common.dart';

abstract class MoviesDataSource {
  Future<MovieResultModel> getNowPlayingMovies(int page);
}

class TmdbApi extends MoviesDataSource {
  final DioClient dioClient;

  TmdbApi({required this.dioClient});

  @override
  Future<MovieResultModel> getNowPlayingMovies(int page) async {
    try {
      Response response = await dioClient.dio.get(
        "/movie/now_playing",
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
