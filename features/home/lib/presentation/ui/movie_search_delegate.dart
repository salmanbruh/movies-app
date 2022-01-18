import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/presentation/bloc/search_movie_bloc.dart';
import 'package:movies_list/presentation/ui/movies_lists.dart';
import 'package:shared/widget/view_all_list_movie_card.dart';

class MovieSearch extends SearchDelegate<List> {
  ScrollController scrollController;
  SearchMovieBloc searchMovieBloc;

  MovieSearch({
    required this.scrollController,
    required this.searchMovieBloc,
  });

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            query = "";
            searchMovieBloc.add(Clear());
          },
          icon: const Icon(Icons.clear),
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () {
          close(context, []);
        },
        icon: const Icon(Icons.arrow_back_ios_new),
      );

  @override
  Widget buildResults(BuildContext context) {
    searchMovieBloc.add(Search(query: query));
    return BlocBuilder<SearchMovieBloc, SearchMovieState>(
      bloc: searchMovieBloc,
      builder: (context, state) {
        switch (state.status) {
          case SearchMovieStatus.failure:
            return const Center(
              child: Text("An error occured. Please try again!"),
            );
          case SearchMovieStatus.success:
            return state.movies.isEmpty
                ? const Center(child: Text("No movies found."))
                : ListView.builder(
                    itemBuilder: (context, index) =>
                        index >= state.movies.length
                            ? const BottomLoader()
                            : ViewAllListMovieCard(movie: state.movies[index]),
                    itemCount: state.status == SearchMovieStatus.maxed
                        ? state.movies.length
                        : state.movies.length + 1,
                    controller: scrollController,
                  );
          default:
            return Container();
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) => Container();
}
