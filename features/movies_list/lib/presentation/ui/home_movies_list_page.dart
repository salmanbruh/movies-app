import 'package:flutter/material.dart';

class HomeMoviesListPage extends StatefulWidget {
  const HomeMoviesListPage({Key? key}) : super(key: key);

  @override
  _MoviesListState createState() => _MoviesListState();
}

class _MoviesListState extends State<HomeMoviesListPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Movies List"),
    );
  }
}
