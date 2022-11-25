import '../../domain/entities/movie_entity.dart';

abstract class MoviesDatasource {
  Future<List<MovieEntity>> getMovies();
}
