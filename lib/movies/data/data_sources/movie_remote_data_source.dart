import 'package:clean_arch/core/error/exceptions.dart';
import 'package:clean_arch/core/network/api_constants.dart';
import 'package:clean_arch/core/network/error_message_model.dart';
import 'package:dio/dio.dart';

import '../models/movie_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovie();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
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
}
