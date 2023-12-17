import 'package:equatable/equatable.dart';

import '../../../core/uitls/enums.dart';
import '../../domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final List<Movie> popularMovies;
  final List<Movie> topRatedMovies;

  final RequestState nowPlayingRequestState;
  final RequestState popularRequestState;
  final RequestState topRatedRequestState;

  final String nowPlayingMessage;
  final String popularMessage;
  final String topRatedMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.popularMovies = const [],
    this.topRatedMovies = const [],
    this.nowPlayingRequestState = RequestState.isLoading,
    this.popularRequestState = RequestState.isLoading,
    this.topRatedRequestState = RequestState.isLoading,
    this.nowPlayingMessage = "",
    this.popularMessage = "",
    this.topRatedMessage = "",
  });

  copyWith({
    List<Movie>? nowPlayingMovies,
    List<Movie>? popularMovies,
    List<Movie>? topRatedMovies,
    RequestState? nowPlayingRequestState,
    RequestState? popularRequestState,
    RequestState? topRatedRequestState,
    String? nowPlayingMessage,
    String? popularMessage,
    String? topRatedMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      popularMovies: popularMovies ?? this.popularMovies,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      nowPlayingRequestState:
          nowPlayingRequestState ?? this.nowPlayingRequestState,
      popularRequestState: popularRequestState ?? this.popularRequestState,
      topRatedRequestState: topRatedRequestState ?? this.topRatedRequestState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        popularMovies,
        topRatedMovies,
        nowPlayingRequestState,
        popularRequestState,
        topRatedRequestState,
        nowPlayingMessage,
        popularMessage,
        topRatedMessage,
      ];
}
