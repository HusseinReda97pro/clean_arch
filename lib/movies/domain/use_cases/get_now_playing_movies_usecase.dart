import 'package:clean_arch/movies/domain/entities/movie.dart';
import 'package:clean_arch/movies/domain/repositories/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

class GetNowPlayingMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;
  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMoviesRepository.getNowPlaying();
  }
}
