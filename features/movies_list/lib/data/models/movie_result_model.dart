import 'package:json_annotation/json_annotation.dart';

part 'movie_result_model.g.dart';

@JsonSerializable()
class MovieResultModel {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "genres", defaultValue: [])
  final List<dynamic> genres;

  @JsonKey(name: "title")
  final String title;

  @JsonKey(name: "overview", defaultValue: "")
  final String overview;

  @JsonKey(name: "poster_path")
  final String posterPath;

  @JsonKey(name: "release_date")
  final String releaseDate;

  @JsonKey(name: "runtime", defaultValue: "")
  final String runtime;

  @JsonKey(name: "vote_average")
  final double voteAverage;

  MovieResultModel({
    required this.id,
    required this.genres,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.runtime,
    required this.voteAverage,
  });

  factory MovieResultModel.fromJson(Map<String, dynamic> json) =>
      _$MovieResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResultModelToJson(this);
}
