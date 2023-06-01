import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc/movies_states.dart';

import '../../../domain/usecases/get_now_playing_usecase.dart';
import 'movies_event.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesStates> {
  final GetNowPlayingUseCase getNowPlayingUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
    this.getNowPlayingUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MoviesStates()) {
    /// Get Now Playing Bloc Handler:
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    /// Get Popular Movies Bloc Handler:
    on<GetPopularMoviesEvent>(_getPopularMovies);

    /// Get TopRated Movies Bloc Handler:
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  /// Get Now Playing Method :
  FutureOr<void> _getNowPlayingMovies(
    GetNowPlayingMoviesEvent event,
    Emitter<MoviesStates> emit,
  ) async {
    // Check the data:
    final result = await getNowPlayingUseCase(const NoParameters());
    // Data loaded (failed or success):
    result.fold(
      // 1. Failed to load data:
      (l) => emit(
        state.copyWith(
          nowPlayingState: RequestState.isLoading,
          nowPlayingMessage: l.message,
        ),
      ),
      // 2. Data Loaded successfully :
      (r) => emit(state.copyWith(
        nowPlayingMovies: r,
        nowPlayingState: RequestState.success,
      )),
    );
  }

  /// Get Popular Movies Method :
  FutureOr<void> _getPopularMovies(
    GetPopularMoviesEvent event,
    Emitter<MoviesStates> emit,
  ) async {
    // Check the data:
    final result = await getPopularMoviesUseCase(const NoParameters());
    // Data loaded (failed or success):
    result.fold(
      // 1. Failed to load data:
      (l) => emit(state.copyWith(
        popularState: RequestState.isLoading,
        popularMessage: l.message,
      )),
      // 2. Data Loaded successfully :
      (r) => emit(state.copyWith(
        popularMovies: r,
        popularState: RequestState.success,
      )),
    );
  }

  /// Get Top Rated Movies Method :

  FutureOr<void> _getTopRatedMovies(
    GetTopRatedMoviesEvent event,
    Emitter<MoviesStates> emit,
  ) async {
    final result = await getTopRatedMoviesUseCase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          topRatedState: RequestState.isLoading,
          topRatedMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          topRatedMovies: r,
          topRatedState: RequestState.success,
        ),
      ),
    );
  }
}
