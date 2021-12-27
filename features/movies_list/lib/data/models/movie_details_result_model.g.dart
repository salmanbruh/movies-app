// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsResultModel _$MovieDetailsResultModelFromJson(
        Map<String, dynamic> json) =>
    MovieDetailsResultModel(
      id: json['id'] as int,
      genres: json['genres'] as List<dynamic>,
      overview: json['overview'] as String,
      posterPath: json['poster_path'] as String? ?? '',
      releaseDate: json['release_date'] as String,
      runtime: json['runtime'] as String,
      title: json['title'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
    );

Map<String, dynamic> _$MovieDetailsResultModelToJson(
        MovieDetailsResultModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'genres': instance.genres,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'runtime': instance.runtime,
      'title': instance.title,
      'vote_average': instance.voteAverage,
    };
