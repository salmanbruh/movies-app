import 'package:equatable/equatable.dart';
import 'package:movies_list/data/models/movie_result_model.dart';

class MovieEntity extends Equatable {
  final int id;
  final List<dynamic> genres;
  final String title;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final int runtime;
  final double voteAverage;

  const MovieEntity({
    required this.id,
    required this.genres,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.runtime,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
        id,
        genres,
        title,
        overview,
        posterPath,
        releaseDate,
        runtime,
        voteAverage,
      ];

  factory MovieEntity.fromMovieResultModel(MovieResultModel movieResultModel) =>
      MovieEntity(
        id: movieResultModel.id,
        genres: movieResultModel.genres,
        title: movieResultModel.title,
        overview: movieResultModel.overview,
        posterPath: movieResultModel.posterPath,
        releaseDate: movieResultModel.releaseDate,
        runtime: movieResultModel.runtime,
        voteAverage: movieResultModel.voteAverage,
      );
}
