import '../entities/movie_entity.dart';
import '../repositories/movies_repository.dart';

abstract class GetMoviesUsecase {
  Future<List<MovieEntity>> call();
}

class GetMoviesUsecaseImpl implements GetMoviesUsecase {
  final MoviesRepository _moviesRepository;

  GetMoviesUsecaseImpl({ required MoviesRepository moviesRepository }) : _moviesRepository = moviesRepository;

  @override
  Future<List<MovieEntity>> call() async {
    return await _moviesRepository.getMovies();
  }
}
