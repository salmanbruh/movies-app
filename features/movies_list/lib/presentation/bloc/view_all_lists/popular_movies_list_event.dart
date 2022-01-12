part of 'popular_movies_list_bloc.dart';

@immutable
abstract class PopularMoviesListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PopularMoviesListFetched extends PopularMoviesListEvent {}
