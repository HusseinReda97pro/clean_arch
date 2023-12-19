import 'package:clean_arch/movies/data/models/genres_model.dart';
import 'package:clean_arch/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.id,
    required super.backdropPath,
    required super.overview,
    required super.releaseDate,
    required super.runTime,
    required super.title,
    required super.voteAverage,
    required super.genres,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json['id'],
      backdropPath: json['backdrop_path'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      runTime: json['runtime'],
      title: json['title'],
      voteAverage: json['vote_average'].toDouble(),
      genres: List.from(json['genres'].map((g) => GenresModel.fromJson(g))),
    );
  }
}
