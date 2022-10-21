import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/base_usecase/base_usecase.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/modules/movies/domain/entities/movie_detail.dart';
import 'package:movie_app/modules/movies/domain/repository/base_movie_repository.dart';

class GetMovieDetailUsecase extends BaseUsecase<MovieDetail, MovieDetailParameters> {
  final BaseMovieRepository baseMovieRepository;
  GetMovieDetailUsecase(this.baseMovieRepository);

  @override
  Future<Either<Failure, MovieDetail>> call(MovieDetailParameters parameters) async {
    return await baseMovieRepository.getMovieDetail(parameters);
  }
}

// to send many parameters as required 
class MovieDetailParameters extends Equatable {
  final int movieId;

  const MovieDetailParameters({required this.movieId});
  
  @override
  List<Object?> get props => [movieId];

}