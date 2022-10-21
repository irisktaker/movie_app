// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:movie_app/core/resources/logger.dart';
// import 'package:movie_app/core/services/services_locator.dart';
// import 'package:movie_app/modules/movies/domain/usecase/get_now_playing_movie_usecase.dart';
// import 'package:movie_app/modules/movies/presentation/controller/movies_bloc.dart';

// class PrevuesTest extends StatelessWidget {
//   const PrevuesTest({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // BaseMovieRemoteDatasource baseMovieRemoteDatasource = MovieRemoteDatasource();
//     // BaseMovieRepository baseMovieRepository = MovieRepository(baseMovieRemoteDatasource);
//     // LoggerDebug.loggerWarningMessage("hashCode in memory ${baseMovieRemoteDatasource.hashCode}");
//     // LoggerDebug.loggerWarningMessage("hashCode in memory ${baseMovieRepository.hashCode}");

//     LoggerDebug.loggerWTFMessage("same hashCode in memory everywhere in the application 'GetNowPlayingMovieUsecase' \n${instance<GetNowPlayingMovieUsecase>().hashCode}");
//     LoggerDebug.loggerWTFMessage("same hashCode in memory everywhere in the application 'MoviesBloc' \n${instance<MoviesBloc>().hashCode}");

//     return BlocProvider(
//         lazy: true,
//         create: (BuildContext context) {
//           return MoviesBloc(instance())..add(GetNowPlayingMoviesEvent());
//         },
//         child: BlocBuilder<MoviesBloc, MoviesState>(builder: (context, state) {
//           // LoggerDebug.loggerDebugMessage(state.toString());

//           return const Scaffold();
//         }));
//   }
// }
