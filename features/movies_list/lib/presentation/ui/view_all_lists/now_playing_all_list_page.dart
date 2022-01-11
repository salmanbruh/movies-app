import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_list/presentation/bloc/view_all_lists/all_now_playing_movies_list_bloc.dart';
import 'package:movies_list/presentation/ui/movies_lists.dart';
import 'package:movies_list/presentation/ui/view_all_lists/view_all_list.dart';
import 'package:shared/widget/view_all_list_movie_card.dart';

class NowPlayingAllListPage extends StatelessWidget {
  const NowPlayingAllListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Modular.get<AllNowPlayingMoviesListBloc>()
        ..add(AllNowPlayingMoviesListFetched()),
      child: const ViewAllListPage(
        categoryName: "Now Playing",
        list: NowPlayingAllListView(),
      ),
    );
  }
}

class NowPlayingAllListView extends StatefulWidget {
  const NowPlayingAllListView({Key? key}) : super(key: key);

  @override
  _NowPlayingAllListViewState createState() => _NowPlayingAllListViewState();
}

class _NowPlayingAllListViewState extends State<NowPlayingAllListView> {
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
    return BlocBuilder<AllNowPlayingMoviesListBloc,
        AllNowPlayingMoviesListState>(
      builder: (context, state) {
        switch (state.status) {
          case AllNowPlayingMoviesStatus.failure:
            return const Center(child: Text("Fail"));
          case AllNowPlayingMoviesStatus.success:
            if (state.movies.isEmpty) {
              return const Center(child: Text("No data"));
            }
            return ListView.builder(
              itemBuilder: (context, index) => index >= state.movies.length
                  ? const BottomLoader()
                  : ViewAllListMovieCard(movie: state.movies[index]),
              itemCount: state.status == AllNowPlayingMoviesStatus.maxed
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
      Modular.get<AllNowPlayingMoviesListBloc>()
          .add(AllNowPlayingMoviesListFetched());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
