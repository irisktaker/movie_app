import 'package:dartz/dartz.dart';
import 'package:movie_app/core/base_usecase/base_usecase.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/modules/movies/domain/entities/movie.dart';
import 'package:movie_app/modules/movies/domain/repository/base_movie_repository.dart';

class GetPopularMovieUsecase extends BaseUsecase<List<Movie>, NoParameters> {
  final BaseMovieRepository baseMovieRepository;
  GetPopularMovieUsecase(this.baseMovieRepository);
  
  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMovieRepository.getPopularMovies();
  }

}
