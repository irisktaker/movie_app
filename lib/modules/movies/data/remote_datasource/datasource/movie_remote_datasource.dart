import 'package:dio/dio.dart';
import 'package:movie_app/core/error/exceptions.dart';
import 'package:movie_app/core/network/api_constants.dart';
import 'package:movie_app/core/network/error_message_model.dart';
import 'package:movie_app/modules/movies/data/remote_datasource/model/movie_detail_model.dart';
import 'package:movie_app/modules/movies/data/remote_datasource/model/movie_model.dart';
import 'package:movie_app/modules/movies/data/remote_datasource/model/recommendation_model.dart';
import 'package:movie_app/modules/movies/domain/entities/recommendation.dart';
import 'package:movie_app/modules/movies/domain/usecase/get_movie_detail_usecase.dart';
import 'package:movie_app/modules/movies/domain/usecase/get_recommendation_usecase.dart';

abstract class BaseMovieRemoteDatasource {
  Future<List<MovieModel>> getNowPlayingMovie();
  Future<List<MovieModel>> getPopularMovie();
  Future<List<MovieModel>> getTopRatedMovie();
  Future<MovieDetailModel> getMovieDetail(MovieDetailParameters parameters);
  Future<List<Recommendation>> getRecommendation(RecommendationParameters parameters);
}

class MovieRemoteDatasource implements BaseMovieRemoteDatasource {
  @override
  Future<List<MovieModel>> getNowPlayingMovie() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviePath);

    // LoggerDebug.loggerDebugMessage(response.toString());

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map((e) => MovieModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovie() async {
    final response = await Dio().get(ApiConstance.popularMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map((e) => MovieModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovie() async {
    final response = await Dio().get(ApiConstance.topRatedMoviePath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map((e) => MovieModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MovieDetailModel> getMovieDetail(MovieDetailParameters parameters) async {
    final response = await Dio().get(ApiConstance.movieDetailPath(parameters.movieId));

    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(response.data);
    } else {
      throw ServerException(
        ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<Recommendation>> getRecommendation(RecommendationParameters parameters) async {
    final response = await Dio().get(ApiConstance.movieRecommendationPath(parameters.id));

    if (response.statusCode == 200) {
      return List<RecommendationModel>.from(
        (response.data['results'] as List).map((e) => RecommendationModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
