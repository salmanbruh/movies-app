import 'package:flutter/material.dart';

class FavoritesListPage extends StatefulWidget {
  const FavoritesListPage({Key? key}) : super(key: key);

  @override
  _FavoritesListPageState createState() => _FavoritesListPageState();
}

class _FavoritesListPageState extends State<FavoritesListPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Favorites Page"),
    );
  }
}
