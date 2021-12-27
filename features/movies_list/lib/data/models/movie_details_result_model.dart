import 'package:json_annotation/json_annotation.dart';

part 'movie_details_result_model.g.dart';

@JsonSerializable()
class MovieDetailsResultModel {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "genres")
  final List<dynamic> genres;

  @JsonKey(name: "overview")
  final String overview;

  @JsonKey(name: "poster_path", defaultValue: "")
  final String posterPath;

  @JsonKey(name: "release_date")
  final String releaseDate;

  @JsonKey(name: "runtime")
  final String runtime;

  @JsonKey(name: "title")
  final String title;

  @JsonKey(name: "vote_average")
  final double voteAverage;

  MovieDetailsResultModel({
    required this.id,
    required this.genres,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.runtime,
    required this.title,
    required this.voteAverage,
  });

  factory MovieDetailsResultModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsResultModelToJson(this);
}
