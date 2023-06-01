import 'package:dio/dio.dart';
import 'package:movies_app/core/network/api_constants.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/movies/data/models/movies_model.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';

import '../../../../core/error/exceptions.dart';
import '../../models/movie_details_model.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies();
  Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameter);
}

class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource {


  /// *********** This is the implementation method for Get Now Playing: *************
  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstants.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      final List body = response.data["results"];
      List<MoviesModel> dataBody =
          body.map((e) => MoviesModel.fromJson(e)).toList();
      return dataBody;
      //******************************************
      // its another implementation:********
      // return List<MoviesModel>.from((response.data["results"] as List)
      //     .map((e) => MoviesModel.fromJson(e)));
      // *******************************************
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }


  /// *********** This is the implementation method for Get Popular Movies: *************
  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstants.popularMoviesPath);
    if (response.statusCode == 200) {
      final List body = response.data["results"];
      List<MoviesModel> dataBody =
          body.map((e) => MoviesModel.fromJson(e)).toList();
      return dataBody;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  /// *********** This is the implementation method for Get TopRated Movies: *************
  @override
  Future<List<MoviesModel>> getTopRatedMovies() async{
    final response = await Dio().get(ApiConstants.topRatedMoviesPath);
    if(response.statusCode == 200){
      final List body = response.data["results"];
      List<MoviesModel> dataBody = body.map((e) => MoviesModel.fromJson(e)).toList();
      return dataBody;
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data),);
    }

  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameter) async{
    final response = await Dio().get(ApiConstants.movieDetailsPath(parameter.movieId));
    if(response.statusCode == 200){
      return MovieDetailsModel.fromJson(response.data);
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data),);
    }
  }





}
