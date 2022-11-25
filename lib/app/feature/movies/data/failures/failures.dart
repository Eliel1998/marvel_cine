import '../../../../core/failures/failure.dart';

abstract class MovieFailure extends Failure {
  MovieFailure({
    String errorMessage = '',
    StackTrace? stackTrace,
    String? label,
  }) : super(
          errorMessage: errorMessage,
          stackTrace: stackTrace,
          label: label,
        );
}

class DataSourceMovieFailure extends MovieFailure {
  DataSourceMovieFailure({
    required String errorMessage,
    StackTrace? stackTrace,
    String? label,
  }) : super(
          errorMessage: errorMessage,
          stackTrace: stackTrace,
          label: label,
        );
}

class NoInternetMovieFailure extends MovieFailure {
  NoInternetMovieFailure({
    String errorMessage = 'Você esta sem internet, tente novamente.',
    StackTrace? stackTrace,
    String? label,
  }) : super(
          errorMessage: errorMessage,
          stackTrace: stackTrace,
          label: label,
        );
}

class UnknownMovieFailure extends MovieFailure {
  UnknownMovieFailure({
    String errorMessage = 'Ocorreu um erro inesperado, tente novamente.',
    StackTrace? stackTrace,
    String? label,
  }) : super(
          errorMessage: errorMessage,
          stackTrace: stackTrace,
          label: label,
        );
}

class InvalidCredentialsMovieFailure extends MovieFailure {
  InvalidCredentialsMovieFailure({
    String errorMessage = 'Credenciais invalidas, tente novamente.',
    StackTrace? stackTrace,
    String? label,
  }) : super(
          errorMessage: errorMessage,
          stackTrace: stackTrace,
          label: label,
        );
}
