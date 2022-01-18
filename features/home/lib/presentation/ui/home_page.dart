import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:favorites_list/favorites_list.dart';
import 'package:home/presentation/bloc/search_movie_bloc.dart';
import 'package:home/presentation/ui/movie_search_delegate.dart';
import 'package:movies_list/presentation/ui/movies_lists.dart';
import 'package:nav_drawer/nav_drawer.dart';
import 'package:nav_drawer/presentation/bloc/appdrawer_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppdrawerBloc(),
        ),
        BlocProvider(
          create: (context) => Modular.get<SearchMovieBloc>(),
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: MovieSearch(
                      scrollController: _scrollController,
                      searchMovieBloc: Modular.get<SearchMovieBloc>()
                        ..add(Clear()),
                    ),
                  );
                },
                icon: const Icon(Icons.search),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Icon(Icons.notifications),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 16, 0),
              child: Icon(Icons.person),
            )
          ],
        ),
        drawer: const AppDrawer(),
        body: BlocBuilder<AppdrawerBloc, AppdrawerState>(
          buildWhen: (prev, curr) => prev != curr,
          builder: (context, state) {
            if (state == AppdrawerState.favoritesPage) {
              return const FavoritesListPage();
            } else {
              return const HomeMoviesListPage();
            }
          },
        ),
      ),
    );
  }

  void _onScroll() {
    if (_isBottom) {
      Modular.get<SearchMovieBloc>().add(LoadNextResults());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
