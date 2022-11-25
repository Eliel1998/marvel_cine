import 'package:get/get.dart';
import 'package:marvel_cine/app/core/services/fake_dio/fake_dio_client.dart';
import 'package:marvel_cine/app/feature/movies/data/datasource/movies_datasource_impl.dart';
import 'package:marvel_cine/app/feature/movies/data/repositories/movies_repository_impl.dart';
import 'package:marvel_cine/app/feature/movies/domain/usecases/get_movies_usecase.dart';
import 'package:marvel_cine/app/feature/movies/presenter/store/movie_store.dart';

import '../../../../feature/movies/presenter/controller/movies_controller.dart';

class MoviesControllerBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put(FakeDioClient());
    Get.lazyPut(()=> MovieStore());
    Get.put(MoviesDatasourceImpl(dio: Get.find<FakeDioClient>()));
    Get.put(MoviesRepositoryImpl(moviesDatasource: Get.find<MoviesDatasourceImpl>()));
    Get.put(GetMoviesUsecaseImpl(moviesRepository: Get.find<MoviesRepositoryImpl>()));
    Get.lazyPut(()=> MoviesController(getMoviesUsecase: Get.find<GetMoviesUsecaseImpl>(), movieStore: Get.find<MovieStore>()));
  }
}