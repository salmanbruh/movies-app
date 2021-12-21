import 'package:flutter/material.dart';
import 'package:movies_list/presentation/ui/movies_lists.dart';

class HomeMoviesListPage extends StatefulWidget {
  const HomeMoviesListPage({Key? key}) : super(key: key);

  @override
  _MoviesListState createState() => _MoviesListState();
}

class _MoviesListState extends State<HomeMoviesListPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: const [
          HomeNowPlayingMoviesList(),
          Divider(),
          HomePopularMoviesList(),
          Divider(),
          HomeTopRatedMoviesList(),
          Divider(),
          HomeUpcomingMoviesList(),
        ],
      ),
    );
  }
}
