import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:simple_todo_app/movie_fetch_api/movie_model.dart';

Future<List<Movie>> fetchMovies(String query) async {
  final response = await http.get(
    Uri.parse('https://api.themoviedb.org/3/search/movie?api_key=b944d6eba2d3f434fdb9d98457345ae8&query=$query'),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final List movies = data['results'];
    return movies.map((movie) => Movie.fromJson(movie)).toList();
  } else {
    throw Exception('Failed to load movies');
  }
}
