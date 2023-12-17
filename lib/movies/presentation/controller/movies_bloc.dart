import 'package:clean_arch/core/uitls/enums.dart';
import 'package:clean_arch/movies/domain/use_cases/get_popular_movies_usecase.dart';
import 'package:clean_arch/movies/domain/use_cases/get_top_rated_movies_usecase.dart';
import 'package:clean_arch/movies/presentation/controller/movies_event.dart';
import 'package:clean_arch/movies/presentation/controller/movies_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/get_now_playing_movies_usecase.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  void _getNowPlayingMovies(
      GetNowPlayingMoviesEvent moviesEvent, Emitter emit) async {
    final result = await getNowPlayingMoviesUseCase.execute();
    result.fold(
      (l) => emit(state.copyWith(
        nowPlayingRequestState: RequestState.isError,
        nowPlayingMessage: l.message,
      )),
      (r) => emit(state.copyWith(
        nowPlayingMovies: r,
        nowPlayingRequestState: RequestState.isLoaded,
      )),
    );
  }

  void _getPopularMovies(
      GetPopularMoviesEvent moviesEvent, Emitter emit) async {
    final result = await getPopularMoviesUseCase.execute();
    result.fold(
      (l) => emit(
        state.copyWith(
          popularRequestState: RequestState.isError,
          popularMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          popularMovies: r,
          popularRequestState: RequestState.isLoaded,
        ),
      ),
    );
  }

  void _getTopRatedMovies(
      GetTopRatedMoviesEvent moviesEvent, Emitter emit) async {
    final result = await getTopRatedMoviesUseCase.execute();
    result.fold(
      (l) => emit(
        state.copyWith(
          topRatedRequestState: RequestState.isError,
          topRatedMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          topRatedMovies: r,
          topRatedRequestState: RequestState.isLoaded,
        ),
      ),
    );
  }
}
