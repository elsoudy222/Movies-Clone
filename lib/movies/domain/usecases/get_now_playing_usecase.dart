import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repo.dart';

class GetNowPlayingUseCase{
  BaseMoviesRepo baseMoviesRepo;
  GetNowPlayingUseCase(this.baseMoviesRepo);

  Future<List<Movies>> getNowPlaying()async{
    return await baseMoviesRepo.getNowPlaying();
  }
}