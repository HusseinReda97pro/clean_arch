import 'package:clean_arch/movies/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlaying();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> gtTopRatedMovies();
}
