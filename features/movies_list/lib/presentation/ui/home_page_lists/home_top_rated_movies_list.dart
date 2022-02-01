import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_list/domain/entities/movies_entity.dart';
import 'package:movies_list/presentation/bloc/blocs.dart';
import 'package:movies_list/presentation/ui/movies_lists.dart';
import 'package:shared/common/common.dart';
import 'package:shared/widget/widget.dart';

class HomeTopRatedMoviesList extends StatefulWidget {
  const HomeTopRatedMoviesList({Key? key}) : super(key: key);

  @override
  _HomeTopRatedMoviesListState createState() => _HomeTopRatedMoviesListState();
}

class _HomeTopRatedMoviesListState extends State<HomeTopRatedMoviesList> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          Modular.get<TopRatedMoviesBloc>()..add(TopRatedMoviesLoadData()),
      child: HomeMoviesCategoriesList(
        categoryName: "Top Rated",
        viewAllOnTapFunction: () => Modular.to.pushNamed(
          Modular.get<NamedRoutes>().moviesList +
              Modular.get<NamedRoutes>().moviesListTopRated,
        ),
        list: _topRatedMoviesList(context),
      ),
    );
  }

  Widget _topRatedMoviesList(BuildContext context) {
    return BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState>(
      builder: (context, state) {
        if (state is TopRatedMoviesHasData) {
          List moviesList = state.props[0] as List;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: moviesList.length,
            itemBuilder: (context, index) {
              MovieEntity movie = moviesList[index];
              return HomePageMovieCard(movie: movie);
            },
          );
        } else if (state is TopRatedMoviesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TopRatedMoviesError) {
          return Center(child: Text(state.message));
        } else if (state is TopRatedMoviesNoData) {
          return Center(child: Text(state.message));
        } else if (state is TopRatedMoviesNoInternetConnection) {
          return Center(child: Text(state.message));
        } else {
          return const Text("Unknown Error");
        }
      },
    );
  }
}
