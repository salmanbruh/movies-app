import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nav_drawer/presentation/bloc/appdrawer_bloc.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text("Home"),
                    onTap: () {
                      BlocProvider.of<AppdrawerBloc>(context)
                          .add(MoviesListPageEvent());
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.favorite),
                    title: const Text("Favorites"),
                    onTap: () {
                      BlocProvider.of<AppdrawerBloc>(context)
                          .add(FavoritesPageEvent());
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
