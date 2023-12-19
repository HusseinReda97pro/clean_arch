import 'package:clean_arch/core/error/exceptions.dart';
import 'package:clean_arch/core/error/failure.dart';
import 'package:clean_arch/movies/data/data_sources/movie_remote_data_source.dart';
import 'package:clean_arch/movies/domain/entities/movie.dart';
import 'package:clean_arch/movies/domain/entities/movie_details.dart';
import 'package:clean_arch/movies/domain/entities/recommendation.dart';
import 'package:clean_arch/movies/domain/repositories/base_movies_repository.dart';
import 'package:clean_arch/movies/domain/use_cases/get_movie_details_usecase.dart';
import 'package:clean_arch/movies/domain/use_cases/get_recommendation_usecase.dart';
import 'package:dartz/dartz.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlaying() async {
    try {
      final result = await baseMovieRemoteDataSource.getNowPlayingMovie();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    try {
      final result = await baseMovieRemoteDataSource.getPopularMovies();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    try {
      final result = await baseMovieRemoteDataSource.getTopRatedMovies();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters) async {
    try {
      final result =
          await baseMovieRemoteDataSource.getMovieDetails(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters) async {
    try {
      final result =
          await baseMovieRemoteDataSource.getMovieRecommendation(parameters);

      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
