class Movie {
  final String title;
  final String overview;
  final String? release_date;
  final String posterPath;
  final String? backdrop_path;
  final String? original_language;
  final double? vote_average;
  final double? popularity;

  Movie(
      {required this.title,
      required this.overview,
      required this.posterPath,
      this.backdrop_path,
      this.release_date,
      this.vote_average,
      this.popularity,
      this.original_language});

  factory Movie.fromJson(Map<dynamic, dynamic> json) {
    return Movie(
      title: json['title'],
      overview: json['overview'],
      release_date: json['release_date'],
      vote_average: json['vote_average'],
      popularity: json['popularity'],
      original_language: json['original_language'],
      posterPath: json['poster_path'] ?? '',
      backdrop_path: json['backdrop_path'] ?? '',
    );
  }
}
