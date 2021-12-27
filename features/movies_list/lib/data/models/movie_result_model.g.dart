// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResultModel _$MovieResultModelFromJson(Map<String, dynamic> json) =>
    MovieResultModel(
      id: json['id'] as int,
      genres: json['genres'] as List<dynamic>? ?? [],
      title: json['title'] as String,
      overview: json['overview'] as String? ?? '',
      posterPath: json['poster_path'] as String,
      releaseDate: json['release_date'] as String,
      runtime: json['runtime'] as String? ?? '',
      voteAverage: (json['vote_average'] as num).toDouble(),
    );

Map<String, dynamic> _$MovieResultModelToJson(MovieResultModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'genres': instance.genres,
      'title': instance.title,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'runtime': instance.runtime,
      'vote_average': instance.voteAverage,
    };
