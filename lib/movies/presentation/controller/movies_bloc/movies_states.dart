import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';

import '../../../domain/entities/movies.dart';

class MoviesStates extends Equatable {
  final List<Movies> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;
  final List<Movies> popularMovies;
  final RequestState popularState;
  final String popularMessage;
  final List<Movies> topRatedMovies;
  final RequestState topRatedState;
  final String topRatedMessage;

  const MoviesStates({
    this.nowPlayingMovies = const[],
    this.nowPlayingState = RequestState.isLoading,
    this.nowPlayingMessage = "",
    this.popularMovies = const[],
    this.popularState = RequestState.isLoading,
    this.popularMessage = "",
    this.topRatedMovies = const[],
    this.topRatedState = RequestState.isLoading,
    this.topRatedMessage = "",
  });
  MoviesStates copyWith({
    List<Movies>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,
    List<Movies>? popularMovies,
    RequestState? popularState,
    String? popularMessage,
    List<Movies>? topRatedMovies,
    RequestState? topRatedState,
    String? topRatedMessage,
  }) {
    return MoviesStates(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    nowPlayingMovies,
    nowPlayingState,
    nowPlayingMessage,
    popularMovies,
    popularState,
    popularMessage,
    topRatedMovies,
    topRatedState,
    topRatedMessage,
  ];
}
