import 'package:json_annotation/json_annotation.dart';
import 'package:movies_list/data/models/movie_result_model.dart';

part 'movies_list_result_model.g.dart';

@JsonSerializable()
class MoviesListResultModel {
  @JsonKey(name: "results")
  final List<MovieResultModel> movies;

  @JsonKey(name: "page")
  final int page;

  @JsonKey(name: "total_pages")
  final int totalPages;

  MoviesListResultModel({
    required this.movies,
    required this.page,
    required this.totalPages,
  });

  factory MoviesListResultModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesListResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesListResultModelToJson(this);
}
