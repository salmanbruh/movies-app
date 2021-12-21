import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String genres;
  final String title;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final String runtime;
  final double voteAverage;

  const MovieEntity({
    required this.genres,
    required this.title,
    this.overview = "",
    required this.posterPath,
    required this.releaseDate,
    required this.runtime,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
        genres,
        title,
        overview,
        posterPath,
        releaseDate,
        runtime,
        voteAverage,
      ];
}
