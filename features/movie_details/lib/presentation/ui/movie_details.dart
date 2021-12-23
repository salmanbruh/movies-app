import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MovieDetails extends StatefulWidget {
  final int movieId;
  const MovieDetails({required this.movieId, Key? key}) : super(key: key);

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () => Modular.to.pop(),
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.red),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Test 1"),
                      Text("Test 2"),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(flex: 2, child: Text("Test 2")),
        ],
      ),
    );
  }
}
