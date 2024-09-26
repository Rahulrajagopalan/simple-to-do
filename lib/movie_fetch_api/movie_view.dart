import 'package:flutter/material.dart';
import 'package:simple_todo_app/movie_fetch_api/fetch_movie.dart';
import 'package:simple_todo_app/movie_fetch_api/movie_details.dart';
import 'package:simple_todo_app/movie_fetch_api/movie_model.dart';

class MovieViewScreen extends StatefulWidget {
  const MovieViewScreen({super.key});

  @override
  _MovieViewScreenState createState() => _MovieViewScreenState();
}

class _MovieViewScreenState extends State<MovieViewScreen> {
  late Future<List<Movie>> _futureMovies;
  final _searchController = TextEditingController();

  void _searchMovies() {
    setState(() {
      _futureMovies = fetchMovies(_searchController.text);
    });
  }

  @override
  void initState() {
    super.initState();
    _futureMovies = fetchMovies("e");
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Profile",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    )),
              ),
              TextButton(onPressed: () {}, child: Text("Settings")),
              TextButton(onPressed: () {}, child: Text("Logout")),
            ],
          ),
        ),
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
          title: Text(
            'Movies List',
            style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.location_city),
              ),
              Tab(
                icon: Icon(Icons.favorite),
              ),
              Tab(
                icon: Icon(Icons.work),
              ),
            ]
            ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
              BottomNavigationBarItem(icon: Icon(Icons.add), label: "add"),
              BottomNavigationBarItem(icon: Icon(Icons.camera), label: "Capture"),
              ]),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: TabBarView(children: [
                  Center(child: Text("First"),),
                  Center(child: Text("Sec"),),
                  Center(child: Text("Thri"),),
                ]),
              ),
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.ballot),
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  hintText: 'Search for a movie...',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: _searchMovies,
                  ),
                ),
              ),
              Divider(),
              SizedBox(height: 20),
              Expanded(
                child: FutureBuilder<List<Movie>>(
                  future: _futureMovies,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No movies found'));
                    } else {
                      final movies = snapshot.data!;
                      return ListView.builder(
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          final movie = movies[index];
                          String over = movie.overview.split(".").first;
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MovieDetails(
                                            movie: movie,
                                          )));
                            },
                            child: Card(
                              color: Colors.grey[200],
                              child: ListTile(
                                leading: movie.posterPath.isNotEmpty
                                    ? Image.network(
                                        'https://image.tmdb.org/t/p/w92${movie.posterPath}')
                                    : null,
                                title: Text(movie.title),
                                subtitle: Text("$over..."),
                                trailing: Icon(Icons.book),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
