import 'package:movie_app/modules/movies/data/remote_datasource/model/genres_model.dart';
import 'package:movie_app/modules/movies/domain/entities/movie_detail.dart';

class MovieDetailModel extends MovieDetail {
  const MovieDetailModel({
    required super.backdropPath,
    required super.genres,
    required super.id,
    required super.overview,
    required super.releaseDate,
    required super.runtime,
    required super.title,
    required super.voteAverage,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) => MovieDetailModel(
        backdropPath: json['backdrop_path'],
        genres: List<GenresModel>.from(
          json['genres'].map(
            (e) => GenresModel.fromJson(e),
          ),
        ),
        id: json['id'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        runtime: json['runtime'],
        title: json['title'],
        voteAverage: json['vote_average'].toDouble(),
      );
}
