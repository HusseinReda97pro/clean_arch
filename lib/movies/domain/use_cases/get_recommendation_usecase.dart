import 'package:clean_arch/core/error/failure.dart';
import 'package:clean_arch/core/use_case/base_useCase.dart';
import 'package:clean_arch/movies/domain/repositories/base_movies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../entities/recommendation.dart';

class GetRecommendationUseCase
    extends BaseUseCase<List<Recommendation>, RecommendationParameters> {
  final BaseMoviesRepository baseMoviesRepository;
  GetRecommendationUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationParameters parameters) {
    return baseMoviesRepository.getRecommendation(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int movieId;
  const RecommendationParameters({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}
