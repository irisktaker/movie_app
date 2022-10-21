import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/modules/movies/domain/entities/movie.dart';
import 'package:movie_app/modules/movies/domain/entities/movie_detail.dart';
import 'package:movie_app/modules/movies/domain/entities/recommendation.dart';
import 'package:movie_app/modules/movies/domain/usecase/get_movie_detail_usecase.dart';
import 'package:movie_app/modules/movies/domain/usecase/get_recommendation_usecase.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovie();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetail>> getMovieDetail(MovieDetailParameters parameters);
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameters parameters);
}
