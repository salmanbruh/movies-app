import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_list/domain/domain.dart';
import 'package:movies_list/presentation/bloc/blocs.dart';
import 'package:movies_list/presentation/ui/movies_lists.dart';
import 'package:shared/widget/widget.dart';

class HomeUpcomingMoviesList extends StatefulWidget {
  const HomeUpcomingMoviesList({Key? key}) : super(key: key);

  @override
  _HomeUpcomingMoviesListState createState() => _HomeUpcomingMoviesListState();
}

class _HomeUpcomingMoviesListState extends State<HomeUpcomingMoviesList> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          Modular.get<UpcomingMoviesBloc>()..add(UpcomingMoviesLoadData()),
      child: HomeMoviesCategoriesList(
        categoryName: "Upcoming",
        viewAllOnTapFunction: () {},
        list: _upcomingMoviesList(context),
      ),
    );
  }

  Widget _upcomingMoviesList(BuildContext context) =>
      BlocBuilder<UpcomingMoviesBloc, UpcomingMoviesState>(
        builder: (context, state) {
          if (state is UpcomingMoviesHasData) {
            List moviesList = state.props[0] as List;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: moviesList.length,
              itemBuilder: (context, index) {
                MovieEntity movie = moviesList[index];
                return HomePageMovieCard(movie: movie);
              },
            );
          } else if (state is UpcomingMoviesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UpcomingMoviesError) {
            return Center(child: Text(state.message));
          } else if (state is UpcomingMoviesNoData) {
            return Center(child: Text(state.message));
          } else if (state is UpcomingMoviesNoInternetConnection) {
            return Center(child: Text(state.message));
          } else {
            return const Text("Unknown Error");
          }
        },
      );
}
