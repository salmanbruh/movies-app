import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_list/domain/entities/movies_entity.dart';

class MovieDetails extends StatefulWidget {
  final MovieEntity movie;
  const MovieDetails({required this.movie, Key? key}) : super(key: key);

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
                      Text(widget.movie.title),
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
