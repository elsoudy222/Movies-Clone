import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';

import '../repository/base_movies_repo.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetails, MovieDetailsParameters> {
  BaseMoviesRepo baseMoviesRepo;

  GetMovieDetailsUseCase(this.baseMoviesRepo);

  @override
  Future<Either<Failure, MovieDetails>> call(
    MovieDetailsParameters parameter,
  ) async {
    return await baseMoviesRepo.getMovieDetails(parameter);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({required this.movieId});

  @override
  List<Object> get props => [
        movieId,
      ];
}
