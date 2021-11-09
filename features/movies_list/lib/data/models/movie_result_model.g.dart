// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResultModel _$MovieResultModelFromJson(Map<String, dynamic> json) =>
    MovieResultModel(
      movies: (json['results'] as List<dynamic>)
          .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieResultModelToJson(MovieResultModel instance) =>
    <String, dynamic>{
      'results': instance.movies,
    };
