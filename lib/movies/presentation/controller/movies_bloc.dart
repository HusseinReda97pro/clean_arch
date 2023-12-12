import 'package:clean_arch/core/uitls/enums.dart';
import 'package:clean_arch/movies/presentation/controller/movies_event.dart';
import 'package:clean_arch/movies/presentation/controller/movies_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/get_now_playing_movies_usecase.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  void _getNowPlayingMovies(
      GetNowPlayingMoviesEvent moviesEvent, Emitter emit) async {
    final result = await getNowPlayingMoviesUseCase.execute();
    result.fold(
      (l) => emit(
        MoviesState(
          requestState: RequestState.isError,
          nowPlayingMessage: l.message,
        ),
      ),
      (r) => emit(
        MoviesState(
          nowPlayingMovies: r,
          requestState: RequestState.isLoaded,
        ),
      ),
    );
  }

  void _getPopularMovies(GetPopularMoviesEvent moviesEvent, Emitter emit) {}
  void _getTopRatedMovies(GetTopRatedMoviesEvent moviesEvent, Emitter emit) {}
}
