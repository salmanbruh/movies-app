import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final List<dynamic> genres;
  final String title;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final String runtime;
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
}
