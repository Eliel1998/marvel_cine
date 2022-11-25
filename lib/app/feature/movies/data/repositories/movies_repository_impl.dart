import '../../domain/entities/movie_entity.dart';
import '../../domain/repositories/movies_repository.dart';
import '../datasource/movies_datasource.dart';
import '../failures/failures.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesDatasource _moviesDatasource;

  MoviesRepositoryImpl({
    required MoviesDatasource moviesDatasource,
  }) : _moviesDatasource = moviesDatasource;

  @override
  Future<List<MovieEntity>> getMovies() async {
    try {
      return await _moviesDatasource.getMovies();
    } on MovieFailure {
      rethrow;
    } catch (error, stackTrace) {
      throw UnknownMovieFailure(
        stackTrace: stackTrace,
        label: 'MoviesRepositoryImpl - getMovies',
      );
    }
  }
}
