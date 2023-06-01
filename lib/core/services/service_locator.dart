
import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/remote/movies_remote_datasource.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repo.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';

import '../../movies/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import '../../movies/presentation/controller/movies_bloc/movies_bloc.dart';

final sl = GetIt.instance;
class ServiceLocator{

  void init(){

    /// Bloc:
    sl.registerFactory(() => MoviesBloc(sl(),sl(),sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl()));

    /// UseCase:
    sl.registerLazySingleton(() => GetNowPlayingUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));


    /// Repository:
    sl.registerLazySingleton<BaseMoviesRepo>(() => MoviesRepository(sl()));

    /// DataSource :
    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(() => MoviesRemoteDataSource());

  }


}