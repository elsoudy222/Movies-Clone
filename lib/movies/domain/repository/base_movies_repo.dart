import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import '../../../core/error/failure.dart';
import '../entities/movie_details.dart';




abstract class BaseMoviesRepo{

  Future<Either< Failure ,List<Movies >>> getNowPlayingMovies();

  Future<Either< Failure ,List<Movies >>> getPopularMovies();

  Future<Either< Failure ,List<Movies >>> getTopRatedMovies();

  Future<Either< Failure ,MovieDetails >> getMovieDetails(MovieDetailsParameters parameter);


}