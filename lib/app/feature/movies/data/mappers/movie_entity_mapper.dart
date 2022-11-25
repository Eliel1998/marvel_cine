import '../../domain/entities/movie_entity.dart';

class MovieEntityMapper {
  static MovieEntity fromMap({required Map<String, dynamic> map}) {
    return MovieEntity(
      adult: map['adult'],
      backdropPath: map['backdrop_path'],
      genreIds: List<int>.from(map['genre_ids']),
      year: map['year'],
      imageUrl: map['image_url'],
      id: map['id'],
      originalLanguage: map['original_language'],
      originalTitle: map['original_title'],
      overview: map['overview'],
      popularity: map['popularity'],
      posterPath: map['poster_path'],
      releaseDate: map['release_date'],
      title: map['title'],
      video: map['video'],
      voteAverage: map['vote_average'],
      voteCount: map['vote_count'],
      
    );
  }
}
