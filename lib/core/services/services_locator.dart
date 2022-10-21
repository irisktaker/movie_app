import 'package:get_it/get_it.dart';
import 'package:movie_app/modules/movies/data/remote_datasource/datasource/movie_remote_datasource.dart';
import 'package:movie_app/modules/movies/data/remote_datasource/repository/movie_repository.dart';
import 'package:movie_app/modules/movies/domain/repository/base_movie_repository.dart';
import 'package:movie_app/modules/movies/domain/usecase/get_movie_detail_usecase.dart';
import 'package:movie_app/modules/movies/domain/usecase/get_now_playing_movie_usecase.dart';
import 'package:movie_app/modules/movies/domain/usecase/get_popular_movie_usecase.dart';
import 'package:movie_app/modules/movies/domain/usecase/get_recommendation_usecase.dart';
import 'package:movie_app/modules/movies/domain/usecase/get_top_rated_movie_usecase.dart';
import 'package:movie_app/modules/movies/presentation/controller/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:movie_app/modules/movies/presentation/controller/movies_bloc/movies_bloc.dart';

/// ***
/// registerLazySingleton:
///  - same hashcode everywhere in the application (so same object in the memory)
///  - create object only when we call it
///
///  registerFactory:
///   - create new object every time it's called
///
///   registerSingleton:
///    - create object when we initialize the screen create object even if not calling it
/// ***

final GetIt instance = GetIt.instance;

class ServicesLocator {
  void initialAppModule() {
    // Bloc
    instance.registerLazySingleton(() => MoviesBloc(
          instance<GetNowPlayingMovieUsecase>(),
          instance<GetPopularMovieUsecase>(),
          instance<GetTopRatedMovieUsecase>(),
        ));
    instance.registerLazySingleton(
      () => MovieDetailBloc(instance<GetMovieDetailUsecase>(), instance<GetRecommendationUsecase>()),
    );

    // Usecases
    instance.registerLazySingleton(() => GetNowPlayingMovieUsecase(instance<BaseMovieRepository>()));
    instance.registerLazySingleton(() => GetPopularMovieUsecase(instance<BaseMovieRepository>()));
    instance.registerLazySingleton(() => GetTopRatedMovieUsecase(instance<BaseMovieRepository>()));
    instance.registerLazySingleton(() => GetMovieDetailUsecase(instance<BaseMovieRepository>()));
    instance.registerLazySingleton(() => GetRecommendationUsecase(instance<BaseMovieRepository>()));


    // Repository
    instance.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(
          instance<BaseMovieRemoteDatasource>(),
        ));
    // Data Source
    instance.registerLazySingleton<BaseMovieRemoteDatasource>(() => MovieRemoteDatasource());
  }
}
