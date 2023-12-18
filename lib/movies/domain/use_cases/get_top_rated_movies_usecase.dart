import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repositories/base_movies_repository.dart';

class GetTopRatedMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;
  GetTopRatedMoviesUseCase(this.baseMoviesRepository);

  Future<Either<Failure, List<Movie>>> call() async {
    return await baseMoviesRepository.gtTopRatedMovies();
  }
}
