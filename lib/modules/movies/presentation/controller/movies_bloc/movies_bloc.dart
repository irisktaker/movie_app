

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/base_usecase/base_usecase.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/modules/movies/domain/entities/movie.dart';
import 'package:movie_app/modules/movies/domain/usecase/get_now_playing_movie_usecase.dart';
import 'package:movie_app/modules/movies/domain/usecase/get_popular_movie_usecase.dart';
import 'package:movie_app/modules/movies/domain/usecase/get_top_rated_movie_usecase.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMovieUsecase getNowPlayingMovieUsecase;
  final GetPopularMovieUsecase getPopularMovieUsecase;
  final GetTopRatedMovieUsecase getTopRatedMovieUsecase;

  MoviesBloc(this.getNowPlayingMovieUsecase, this.getPopularMovieUsecase, this.getTopRatedMovieUsecase)
      : super(
          const MoviesState(),
        ) {
    // add event -> on
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  Future<FutureOr<void>> _getNowPlayingMovies(GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    // BaseMovieRemoteDatasource baseMovieRemoteDatasource = MovieRemoteDatasource();
      // BaseMovieRepository baseMovieRepository = MovieRepository(baseMovieRemoteDatasource);
      // LoggerDebug.loggerWarningMessage("hashCode in memory ${baseMovieRemoteDatasource.hashCode}");
      // final result = await GetNowPlayingMovieUsecase(baseMovieRepository).execute();
      // LoggerDebug.loggerWarningMessage("hashCode in memory ${baseMovieRepository.hashCode}");

      // LoggerDebug.loggerWTFMessage("same hashCode in memory everywhere in the application \n${instance<GetNowPlayingMovieUsecase>().hashCode}");
      // LoggerDebug.loggerWTFMessage("same hashCode in memory everywhere in the application 'MoviesBloc' \n${instance<MoviesBloc>().hashCode}");

      // final result = await getNowPlayingMovieUsecase.execute();
      final result = await getNowPlayingMovieUsecase(const NoParameters());

      // emit(const MoviesState(nowPlayingState: RequestState.loaded));
      // LoggerDebug.loggerInformationMessage(result.toString());

      result.fold(
          (l) => emit(state.copyWith(
                nowPlayingState: RequestState.error,
                nowPlayingMessage: l.message,
              )),
          (r) => emit(state.copyWith(
                nowPlayingState: RequestState.loaded,
                nowPlayingMovies: r,
              )));
  }

  Future<FutureOr<void>> _getPopularMovies(GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMovieUsecase(const NoParameters());
      
      result.fold(
          (l) => emit(state.copyWith(
                popularState: RequestState.error,
                popularMessage: l.message,
              )),
          (r) => emit(state.copyWith(
                popularState: RequestState.loaded,
                popularMovies: r,
              )));
  }

  Future<FutureOr<void>> _getTopRatedMovies(GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMovieUsecase(const NoParameters());

      result.fold(
        (l) => emit(state.copyWith(
          topRatedState: RequestState.error,
          topRatedMessage: l.message,
        )),
        (r) => emit(state.copyWith(
          topRatedState: RequestState.loaded,
          topRatedMovies: r,
        )),
      );
  }
}
