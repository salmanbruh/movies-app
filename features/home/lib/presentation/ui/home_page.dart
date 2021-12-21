import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:favorites_list/favorites_list.dart';
import 'package:movies_list/presentation/ui/movies_lists.dart';
import 'package:nav_drawer/nav_drawer.dart';
import 'package:nav_drawer/presentation/bloc/appdrawer_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppdrawerBloc(),
      child: Scaffold(
        appBar: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Icon(Icons.search),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Icon(Icons.notifications),
            ),
            Padding(
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
}
