import 'package:json_annotation/json_annotation.dart';
part 'movie.g.dart';

@JsonSerializable(explicitToJson: true)
class Movie {
  String? id;
  String? poster;
  String? name;
  String? genre;
  String? description;
  String? language;
  String? country;
  String? writer;
  String? director;
  String? doubanRating;
  String? dateReleased;
  int? doubanVotes;
  List<String>? actors;

  Movie({
    this.id,
    this.poster,
    this.name,
    this.genre,
    this.description,
    this.language,
    this.country,
    this.writer,
    this.director,
    this.doubanRating,
    this.dateReleased,
    this.doubanVotes,
    this.actors,  
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return _$MovieFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}