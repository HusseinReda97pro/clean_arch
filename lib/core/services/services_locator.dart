import 'package:clean_arch/movies/data/data_sources/movie_remote_data_source.dart';
import 'package:clean_arch/movies/data/repositories/movies_repository.dart';
import 'package:clean_arch/movies/domain/repositories/base_movies_repository.dart';
import 'package:clean_arch/movies/domain/use_cases/get_now_playing_movies_usecase.dart';
import 'package:clean_arch/movies/domain/use_cases/get_popular_movies_usecase.dart';
import 'package:clean_arch/movies/presentation/controller/movies_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../movies/domain/use_cases/get_top_rated_movies_usecase.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));

    // UseCase
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));

    // Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));

    // Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
