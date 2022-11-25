

import '../../../../core/services/fake_dio/fake_dio_client.dart';
import '../../../../core/services/fake_dio/fake_response.dart';
import '../../domain/entities/movie_entity.dart';
import '../failures/failures.dart';
import '../mappers/movie_entity_mapper.dart';
import 'movies_datasource.dart';

class MoviesDatasourceImpl implements MoviesDatasource {
  final FakeDioClient _dio;

  MoviesDatasourceImpl({required FakeDioClient dio}) : _dio = dio;
  @override
  Future<List<MovieEntity>> getMovies() async {
    try {
      final FakeResponse response = await _dio.get('https://api.themoviedb.org/3/movies/avangers');

      if (response.statusCode == 200) {
        List<dynamic> responseData = response.data['mcu'];

        final movies = responseData
            .map((movie) => MovieEntityMapper.fromMap(map: movie))
            .toList();

        return movies;
      }
       else {
        throw DataSourceMovieFailure(
          errorMessage: response.data['status_message'],
        );
      }
    }  catch (error, stackTrace) {
      throw DataSourceMovieFailure(
        errorMessage: error.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
