import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:simple_todo_app/movie_fetch_api/movie_model.dart';

class MovieDetails extends StatelessWidget {
  Movie movie;
  MovieDetails({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(movie.title),
        backgroundColor: Colors.grey[300],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text("Language"),
                      Text(movie.original_language!.toUpperCase())
                    ],
                  ),
                  Column(
                    children: [
                      Text("Rating"),
                      Text(movie.vote_average!.toString())
                    ],
                  ),
                ],
              ),
              Container(
                height: 300,
                width: 250,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://image.tmdb.org/t/p/w92${movie.backdrop_path}'),
                        fit: BoxFit.contain)),
              ),
              Card(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(movie.overview),
              )),
              Text(movie.release_date.toString()),
              Text("Movie popularity: ${movie.popularity}"),
              TextButton(
                  onPressed: () {
                    log(movie.title.toString());
                  },
                  child: Text("data")),
            ],
          ),
        ),
      ),
    );
  }
}
