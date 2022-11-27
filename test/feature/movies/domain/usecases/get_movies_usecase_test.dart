import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_cine/app/feature/movies/domain/entities/movie_entity.dart';
import 'package:marvel_cine/app/feature/movies/domain/repositories/movies_repository.dart';
import 'package:marvel_cine/app/feature/movies/domain/usecases/get_movies_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MoviesRepositoryMock extends Mock implements MoviesRepository {}

void main() {
  late MoviesRepositoryMock moviesRepositoryMock;

  late GetMoviesUsecase getMoviesUsecase;

  setUp(() {
    moviesRepositoryMock = MoviesRepositoryMock();
    getMoviesUsecase =
        GetMoviesUsecaseImpl(moviesRepository: moviesRepositoryMock);
  });

  test(
      'Deve retornar List<MovieEntity> quando a chamada para o repositório for sucedida',
      () async {
    //Arrange
    final response = <MovieEntity>[
      MovieEntity(
          adult: false,
          backdropPath: "/yFuKvT4Vm3sKHdFY4eG6I4ldAnn.jpg",
          genreIds: [28, 12, 878],
          year: 2011,
          imageUrl:
              "https://images.justwatch.com/poster/160240627/s592/captain-america-the-first-avenger",
          id: 1771,
          originalLanguage: "en",
          originalTitle: "Captain America: The First Avenger",
          overview:
              "Steve Rogers é um jovem que participa de experiências visando a criação do supersoldado americano. Quando os oficiais militares conseguem transformá-lo em uma arma humana, eles percebem que não podem arriscar a vida do jovem nas batalhas de guerra.",
          popularity: 44.224,
          posterPath: "/xYijVAPunk6neVW2KHKE4Lp45ZU.jpg",
          releaseDate: "2011-07-22",
          title: "Capitão América: O Primeiro Vingador",
          video: false,
          voteAverage: 7.0,
          voteCount: 16878),
    ];

    when(() => moviesRepositoryMock.getMovies()).thenAnswer(
      (_) async => response,
    );

    //Act
    final result = await getMoviesUsecase.call();

    //Assert
    expect(result, response);
  });
}
