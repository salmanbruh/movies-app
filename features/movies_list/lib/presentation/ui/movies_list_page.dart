import 'package:flutter/material.dart';

class MoviesListPage extends StatefulWidget {
  const MoviesListPage({Key? key}) : super(key: key);

  @override
  _MoviesListState createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesListPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Movies List"),
    );
  }
}
