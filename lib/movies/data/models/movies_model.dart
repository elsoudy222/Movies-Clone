import 'package:movies_app/movies/domain/entities/movies.dart';

class MoviesModel extends Movies {
  const MoviesModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.overview,
    required super.voteAverage,
    required super.genreIds,
    required super.releaseDate,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) =>
      MoviesModel(
        id: json["id"],
        title: json["title"],
        backdropPath: json["backdrop_path"],
        overview: json["overview"],
        voteAverage: json["vote_average"],
        genreIds: List<int>.from(json["genre_ids"].map((e)=> e)),
        releaseDate: json["release_date"],
      );


}
