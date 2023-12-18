import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/use_case/base_useCase.dart';
import '../entities/movie.dart';
import '../repositories/base_movies_repository.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>> {
  final BaseMoviesRepository baseMoviesRepository;
  GetPopularMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call() async {
    return await baseMoviesRepository.getPopularMovies();
  }
}
