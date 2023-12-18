import 'package:clean_arch/movies/domain/entities/movie.dart';
import 'package:clean_arch/movies/domain/repositories/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/use_case/base_useCase.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movie>> {
  final BaseMoviesRepository baseMoviesRepository;
  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call() async {
    return await baseMoviesRepository.getNowPlaying();
  }
}
