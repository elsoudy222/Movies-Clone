
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repo.dart';

class GetPopularMoviesUseCase{
  BaseMoviesRepo baseMoviesRepo;
  GetPopularMoviesUseCase(this.baseMoviesRepo);

  Future<List<Movies>> getPopularMovies()async{
    return await baseMoviesRepo.getPopularMovies();
  }
}