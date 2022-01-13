import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_list/presentation/bloc/blocs.dart';
import 'package:movies_list/presentation/ui/movies_lists.dart';
import 'package:shared/widget/view_all_list_movie_card.dart';

class PopularAllListPage extends StatelessWidget {
  const PopularAllListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PopularAllListView extends StatefulWidget {
  const PopularAllListView({Key? key}) : super(key: key);

  @override
  _PopularAllListViewState createState() => _PopularAllListViewState();
}

class _PopularAllListViewState extends State<PopularAllListView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMoviesListBloc, PopularMoviesListState>(
      builder: (context, state) {
        switch (state.status) {
          case PopularMoviesStatus.failure:
            return const Center(child: Text("Fail"));
          case PopularMoviesStatus.success:
            if (state.movies.isEmpty) {
              return const Center(child: Text("No data"));
            }
            return ListView.builder(
              itemBuilder: (context, index) => index >= state.movies.length
                  ? const BottomLoader()
                  : ViewAllListMovieCard(movie: state.movies[index]),
              itemCount: state.status == PopularMoviesStatus.maxed
                  ? state.movies.length
                  : state.movies.length + 1,
              controller: _scrollController,
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  void _onScroll() {
    if (_isBottom) {
      Modular.get<PopularMoviesListBloc>().add(PopularMoviesListFetched());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
