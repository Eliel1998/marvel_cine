import 'package:marvel_cine/app/feature/movies/domain/entities/movie_entity.dart';
import 'package:marvel_cine/app/feature/movies/domain/usecases/get_movies_usecase.dart';

import '../store/movie_store.dart';

class MoviesController {
  final GetMoviesUsecase getMoviesUsecase;
  final MovieStore movieStore;

  MoviesController({
    required this.getMoviesUsecase,
    required this.movieStore,
  });

  void getMovies() async {
    List<MovieEntity> movies = await getMoviesUsecase.call();
    movieStore.addMovies(movies);
  }

  String lineBeak(String value) {
    return value.replaceFirst(RegExp(r':'), ':\n');
  }
}
