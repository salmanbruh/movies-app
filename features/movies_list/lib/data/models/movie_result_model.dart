import 'package:json_annotation/json_annotation.dart';
import 'package:movies_list/data/models/movie_model.dart';

part 'movie_result_model.g.dart';

@JsonSerializable()
class MovieResultModel {
  @JsonKey(name: "results")
  final List<MovieModel> movies;

  MovieResultModel({required this.movies});

  factory MovieResultModel.fromJson(Map<String, dynamic> json) =>
      _$MovieResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResultModelToJson(this);
}
