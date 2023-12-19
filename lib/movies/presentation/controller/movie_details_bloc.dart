import 'package:clean_arch/core/uitls/enums.dart';
import 'package:clean_arch/movies/domain/entities/movie_details.dart';
import 'package:clean_arch/movies/domain/entities/recommendation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/get_movie_details_usecase.dart';
import '../../domain/use_cases/get_recommendation_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;
  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetailsEvent);
    on<GetMovieRecommendationEvent>(_getMovieRecommendation);
  }

  void _getMovieDetailsEvent(GetMovieDetailsEvent event, Emitter emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(movieId: event.id));
    result.fold(
      (l) => emit(
        state.copyWith(
          movieDetailsState: RequestState.isError,
          movieDetailsMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          movieDetails: r,
          movieDetailsState: RequestState.isLoaded,
        ),
      ),
    );
  }

  void _getMovieRecommendation(
      GetMovieRecommendationEvent event, Emitter emit) async {
    final result = await getRecommendationUseCase(
        RecommendationParameters(movieId: event.id));
    result.fold(
      (l) => emit(
        state.copyWith(
          recommendationsState: RequestState.isError,
          recommendationsMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          recommendations: r,
          recommendationsState: RequestState.isLoaded,
        ),
      ),
    );
  }
}
