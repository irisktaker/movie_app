import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/modules/movies/domain/entities/movie_detail.dart';
import 'package:movie_app/modules/movies/domain/entities/recommendation.dart';
import 'package:movie_app/modules/movies/domain/usecase/get_movie_detail_usecase.dart';
import 'package:movie_app/modules/movies/domain/usecase/get_recommendation_usecase.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetailUsecase getMovieDetailUsecase;
  final GetRecommendationUsecase getRecommendationUsecase;

  MovieDetailBloc(this.getMovieDetailUsecase, this.getRecommendationUsecase) : super(const MovieDetailState()) {
    on<GetMovieDetailEvent>(_getMovieDetail);
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }

  Future<FutureOr<void>> _getMovieDetail(GetMovieDetailEvent event, Emitter<MovieDetailState> emit) async {
    final result = await getMovieDetailUsecase(MovieDetailParameters(
      movieId: event.id,
    ));

    result.fold(
        (l) => emit(state.copyWith(
              movieDetailState: RequestState.error,
              movieDetailMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              movieDetail: r,
              movieDetailState: RequestState.loaded,
            )));
  }

  Future<FutureOr<void>> _getRecommendation(GetMovieRecommendationEvent event, Emitter<MovieDetailState> emit) async {
    final result = await getRecommendationUsecase(RecommendationParameters(event.id));

    result.fold(
        (l) => emit(state.copyWith(
              recommendationState: RequestState.error,
              recommendationMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              recommendation: r,
              recommendationState: RequestState.loaded,
            )));
  }
}
