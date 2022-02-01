import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_list/domain/entities/movies_entity.dart';
import 'package:movies_list/presentation/bloc/blocs.dart';
import 'package:movies_list/presentation/ui/movies_lists.dart';
import 'package:shared/shared.dart';

class HomeNowPlayingMoviesList extends StatefulWidget {
  const HomeNowPlayingMoviesList({
    Key? key,
  }) : super(key: key);

  @override
  _HomeNowPlayingMoviesListState createState() =>
      _HomeNowPlayingMoviesListState();
}

class _HomeNowPlayingMoviesListState extends State<HomeNowPlayingMoviesList> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          Modular.get<NowPlayingMoviesBloc>()..add(NowPlayingMoviesLoadData()),
      child: HomeMoviesCategoriesList(
        categoryName: "Now Playing",
        viewAllOnTapFunction: () => Modular.to.pushNamed(
          Modular.get<NamedRoutes>().moviesList +
              Modular.get<NamedRoutes>().moviesListNowPlaying,
        ),
        list: _nowPlayingList(context),
      ),
    );
  }

  Widget _nowPlayingList(BuildContext context) {
    return BlocBuilder<NowPlayingMoviesBloc, NowPlayingMoviesState>(
      builder: (context, state) {
        if (state is NowPlayingMoviesHasData) {
          List moviesList = state.props[0] as List;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: moviesList.length,
            itemBuilder: (context, index) {
              MovieEntity movie = moviesList[index];
              return HomePageMovieCard(movie: movie);
            },
          );
        } else if (state is NowPlayingMoviesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NowPlayingMoviesError) {
          return Center(child: Text(state.message));
        } else if (state is NowPlayingMoviesNoData) {
          return Center(child: Text(state.message));
        } else if (state is NowPlayingMoviesNoInternetConnection) {
          return Center(child: Text(state.message));
        } else {
          return const Text("Unknown Error");
        }
      },
    );
  }
}
