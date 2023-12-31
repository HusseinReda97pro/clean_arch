import 'package:clean_arch/core/error/exceptions.dart';
import 'package:clean_arch/core/network/api_constants.dart';
import 'package:clean_arch/core/network/error_message_model.dart';
import 'package:clean_arch/movies/data/models/recommendation_model.dart';
import 'package:clean_arch/movies/domain/entities/movie_details.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/recommendation.dart';
import '../../domain/use_cases/get_movie_details_usecase.dart';
import '../../domain/use_cases/get_recommendation_usecase.dart';
import '../models/movie_details_model.dart';
import '../models/movie_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovie();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetails> getMovieDetails(MovieDetailsParameters parameters);
  Future<List<Recommendation>> getMovieRecommendation(
      RecommendationParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovie() async {
    final response = await Dio().get(ApiConstants.nowPlayingPath);
    print(response);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((m) => MovieModel.fromJson(m)));
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstants.popularPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((m) => MovieModel.fromJson(m)));
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstants.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((m) => MovieModel.fromJson(m)));
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetails> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final response = await Dio().get(
      ApiConstants.movieDetailsPath(
        parameters.movieId,
      ),
    );
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<Recommendation>> getMovieRecommendation(
      RecommendationParameters parameters) async {
    final response = await Dio().get(
      ApiConstants.movieRecommendationPath(
        parameters.movieId,
      ),
    );
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data['results'] as List)
          .map((m) => RecommendationModel.fromJson(m)));
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }
}
