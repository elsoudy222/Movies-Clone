import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/data/datasource/remote/movies_remote_datasource.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repo.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';

class MoviesRepository extends BaseMoviesRepo {
  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;

  MoviesRepository(this.baseMoviesRemoteDataSource);

  @override
  Future<Either<Failure, List<Movies>>> getNowPlayingMovies() async {
    final result = await baseMoviesRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorMessageModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getPopularMovies() async{
    final result = await baseMoviesRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorMessageModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getTopRatedMovies() async{
    final result = await baseMoviesRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorMessageModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(MovieDetailsParameters parameter) async{
    final result = await baseMoviesRemoteDataSource.getMovieDetails(parameter);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorMessageModel.statusMessage),
      );
    }
  }
}
