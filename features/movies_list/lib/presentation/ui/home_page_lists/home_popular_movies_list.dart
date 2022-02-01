import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_list/domain/entities/movies_entity.dart';
import 'package:movies_list/presentation/bloc/blocs.dart';
import 'package:movies_list/presentation/ui/movies_lists.dart';
import 'package:shared/common/common.dart';
import 'package:shared/widget/widget.dart';

class HomePopularMoviesList extends StatefulWidget {
  const HomePopularMoviesList({Key? key}) : super(key: key);

  @override
  _HomePopularMoviesListState createState() => _HomePopularMoviesListState();
}

class _HomePopularMoviesListState extends State<HomePopularMoviesList> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          Modular.get<PopularMoviesBloc>()..add(PopularMoviesLoadData()),
      child: HomeMoviesCategoriesList(
        categoryName: "Popular",
        viewAllOnTapFunction: () => Modular.to.pushNamed(
          Modular.get<NamedRoutes>().moviesList +
              Modular.get<NamedRoutes>().moviesListPopular,
        ),
        list: _popularMoviesList(context),
      ),
    );
  }

  Widget _popularMoviesList(BuildContext context) {
    return BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
      builder: (context, state) {
        if (state is PopularMoviesHasData) {
          List moviesList = state.props[0] as List;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: moviesList.length,
            itemBuilder: (context, index) {
              MovieEntity movie = moviesList[index];
              return HomePageMovieCard(movie: movie);
            },
          );
        } else if (state is PopularMoviesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PopularMoviesError) {
          return Center(child: Text(state.message));
        } else if (state is PopularMoviesNoData) {
          return Center(child: Text(state.message));
        } else if (state is PopularMoviesNoInternetConnection) {
          return Center(child: Text(state.message));
        } else {
          return const Text("Unknown Error");
        }
      },
    );
  }
}
