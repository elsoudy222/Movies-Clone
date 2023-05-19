import 'package:movies_app/movies/domain/entities/movies.dart';

abstract class BaseMoviesRepo{

  Future<List<Movies>> getNowPlaying();

  Future<List<Movies>> getPopularMovies();

  Future<List<Movies>> getTopRatedMovies();


}