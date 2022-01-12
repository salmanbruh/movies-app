part of 'top_rated_movies_list_bloc.dart';

@immutable
abstract class TopRatedMoviesListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class TopRatedMoviesListFetched extends TopRatedMoviesListEvent {}
