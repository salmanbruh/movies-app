import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_list/presentation/bloc/view_all_lists/upcoming_movies_list_bloc.dart';
import 'package:movies_list/presentation/ui/movies_lists.dart';
import 'package:movies_list/presentation/ui/view_all_lists/view_all_list.dart';
import 'package:shared/widget/view_all_list_movie_card.dart';

class UpcomingAllListPage extends StatelessWidget {
  const UpcomingAllListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Modular.get<UpcomingMoviesListBloc>()
        ..add(UpcomingMoviesListFetched()),
      child: const ViewAllListPage(
        categoryName: "Upcoming",
        list: UpcomingAllListView(),
      ),
    );
  }
}

class UpcomingAllListView extends StatefulWidget {
  const UpcomingAllListView({Key? key}) : super(key: key);

  @override
  _UpcomingAllListViewState createState() => _UpcomingAllListViewState();
}

class _UpcomingAllListViewState extends State<UpcomingAllListView> {
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
    return BlocBuilder<UpcomingMoviesListBloc, UpcomingMoviesListState>(
      builder: (context, state) {
        switch (state.status) {
          case UpcomingMoviesStatus.failure:
            return const Center(child: Text("Fail"));
          case UpcomingMoviesStatus.success:
            if (state.movies.isEmpty) {
              return const Center(child: Text("No data."));
            }
            return ListView.builder(
              itemBuilder: (context, index) => index >= state.movies.length
                  ? const BottomLoader()
                  : ViewAllListMovieCard(movie: state.movies[index]),
              itemCount: state.status == UpcomingMoviesStatus.maxed
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
      Modular.get<UpcomingMoviesListBloc>().add(UpcomingMoviesListFetched());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
