import 'package:dio/dio.dart';
import 'package:movies_app/movies/data/models/movies_model.dart';

class MoviesRemoteDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    final response = await Dio().get(
      "https://api.themoviedb.org/3/movie/now_playing?api_key=36c824fff9529a8497f251ba43bca17d",
    );
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data["results"] as List)
          .map((e) => MoviesModel.fromJson(e)));
    }else{
      throw "Error";
    }
  }
}
