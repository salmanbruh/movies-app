import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "genres", defaultValue: "")
  final String? genres;

  @JsonKey(name: "title")
  final String title;

  @JsonKey(name: "overview", defaultValue: "")
  final String overview;

  @JsonKey(name: "poster_path")
  final String posterPath;

  @JsonKey(name: "release_date")
  final String releaseDate;

  @JsonKey(name: "runtime", defaultValue: "")
  final String? runtime;

  @JsonKey(name: "vote_average")
  final double voteAverage;

  MovieModel({
    required this.id,
    required this.genres,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.runtime,
    required this.voteAverage,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
