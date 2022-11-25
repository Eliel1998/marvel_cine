import 'package:get/get.dart';
import 'package:marvel_cine/app/feature/movies/domain/entities/movie_entity.dart';

class MovieStore extends GetxController{
  RxList<MovieEntity> movies = <MovieEntity>[].obs;

  void addMovies(List<MovieEntity> moviesList){
      movies.addAll(moviesList);
  }
}