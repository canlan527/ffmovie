// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      id: json['id'] as String?,
      poster: json['poster'] as String?,
      name: json['name'] as String?,
      genre: json['genre'] as String?,
      description: json['description'] as String?,
      language: json['language'] as String?,
      country: json['country'] as String?,
      writer: json['writer'] as String?,
      director: json['director'] as String?,
      doubanRating: json['doubanRating'] as String?,
      dateReleased: json['dateReleased'] as String?,
      doubanVotes: json['doubanVotes'] as int?,
      actors:
          (json['actors'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'poster': instance.poster,
      'name': instance.name,
      'genre': instance.genre,
      'description': instance.description,
      'language': instance.language,
      'country': instance.country,
      'writer': instance.writer,
      'director': instance.director,
      'doubanRating': instance.doubanRating,
      'dateReleased': instance.dateReleased,
      'doubanVotes': instance.doubanVotes,
      'actors': instance.actors,
    };
