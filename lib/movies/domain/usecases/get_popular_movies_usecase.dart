
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repo.dart';

import '../../../core/error/failure.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movies>, NoParameters>{
  BaseMoviesRepo baseMoviesRepo;
  GetPopularMoviesUseCase(this.baseMoviesRepo);


  @override
  Future<Either<Failure, List<Movies>>> call(NoParameters parameter) async{
    return await baseMoviesRepo.getPopularMovies();
  }
}