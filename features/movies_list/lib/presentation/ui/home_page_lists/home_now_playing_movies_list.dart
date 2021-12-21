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
      create: (context) => Modular.get<NowPlayingMoviesBloc>()..add(LoadData()),
      child: HomeMoviesCategoriesList(
        categoryName: "Now Playing",
        viewAllOnTapFunction: () {},
        list: _nowPlayingList(context),
      ),
    );
  }

  Widget _nowPlayingList(BuildContext context) {
    return BlocBuilder<NowPlayingMoviesBloc, NowPlayingMoviesState>(
      builder: (context, state) {
        if (state is HasData) {
          List moviesList = state.props[0] as List;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: moviesList.length,
            itemBuilder: (context, index) {
              MovieEntity movie = moviesList[index];
              return HomePageMovieCard(movie: movie);
            },
          );
        } else if (state is Loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is Error) {
          return Center(child: Text(state.message));
        } else if (state is NoData) {
          return Center(child: Text(state.message));
        } else if (state is NoInternetConnection) {
          return Center(child: Text(state.message));
        } else {
          return const Text("Unknown Error");
        }
      },
    );
  }
}
