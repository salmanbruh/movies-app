part of 'upcoming_movies_list_bloc.dart';

@immutable
abstract class UpcomingMoviesListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class UpcomingMoviesListFetched extends UpcomingMoviesListEvent {}
