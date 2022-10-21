import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/exceptions.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/modules/movies/data/remote_datasource/datasource/movie_remote_datasource.dart';
import 'package:movie_app/modules/movies/domain/entities/movie.dart';
import 'package:movie_app/modules/movies/domain/entities/movie_detail.dart';
import 'package:movie_app/modules/movies/domain/entities/recommendation.dart';
import 'package:movie_app/modules/movies/domain/repository/base_movie_repository.dart';
import 'package:movie_app/modules/movies/domain/usecase/get_movie_detail_usecase.dart';
import 'package:movie_app/modules/movies/domain/usecase/get_recommendation_usecase.dart';

class MovieRepository implements BaseMovieRepository {
  final BaseMovieRemoteDatasource baseMovieRemoteDatasource;
  MovieRepository(this.baseMovieRemoteDatasource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovie() async {
    final result = await baseMovieRemoteDatasource.getNowPlayingMovie();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDatasource.getPopularMovie();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDatasource.getTopRatedMovie();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetail(MovieDetailParameters parameters) async {
    final result = await baseMovieRemoteDatasource.getMovieDetail(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
  
  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameters parameters) async {
  final result = await baseMovieRemoteDatasource.getRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  
}
