import 'package:flutter/material.dart';
import 'package:movies_list/movies_list.dart';

class HomeUpcomingMoviesList extends StatefulWidget {
  const HomeUpcomingMoviesList({Key? key}) : super(key: key);

  @override
  _HomeUpcomingMoviesListState createState() => _HomeUpcomingMoviesListState();
}

class _HomeUpcomingMoviesListState extends State<HomeUpcomingMoviesList> {
  @override
  Widget build(BuildContext context) {
    return HomeMoviesCategoriesList(
      categoryName: "Upcoming",
      viewAllOnTapFunction: () {},
      list: _upcomingMoviesList(context),
    );
  }

  Widget _upcomingMoviesList(BuildContext context) => Container();
}
