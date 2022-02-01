// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_list_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesListResultModel _$MoviesListResultModelFromJson(
        Map<String, dynamic> json) =>
    MoviesListResultModel(
      movies: (json['results'] as List<dynamic>)
          .map((e) => MovieResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: json['page'] as int,
      totalPages: json['total_pages'] as int,
    );

Map<String, dynamic> _$MoviesListResultModelToJson(
        MoviesListResultModel instance) =>
    <String, dynamic>{
      'results': instance.movies,
      'page': instance.page,
      'total_pages': instance.totalPages,
    };
