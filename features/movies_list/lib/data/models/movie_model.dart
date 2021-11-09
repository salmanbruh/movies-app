import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel {
  @JsonKey(name: "genres")
  final String? genres;

  @JsonKey(name: "title")
  final String title;

  @JsonKey(name: "overview")
  final String overview;

  @JsonKey(name: "poster_path")
  final String posterPath;

  @JsonKey(name: "release_date")
  final String releaseDate;

  @JsonKey(name: "runtime")
  final String? runtime;

  @JsonKey(name: "vote_average")
  final String voteAverage;

  MovieModel({
    this.genres = "",
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    this.runtime = "",
    required this.voteAverage,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
