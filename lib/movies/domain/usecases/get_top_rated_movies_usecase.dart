
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repo.dart';

class GetTopRatedMoviesUseCase{
  BaseMoviesRepo baseMoviesRepo;
  GetTopRatedMoviesUseCase(this.baseMoviesRepo);

  Future<List<Movies>> getTopRatedMovies()async{
    return await baseMoviesRepo.getTopRatedMovies();
  }

}