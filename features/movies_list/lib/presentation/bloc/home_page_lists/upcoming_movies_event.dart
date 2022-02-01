part of 'upcoming_movies_bloc.dart';

abstract class UpcomingMoviesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class UpcomingMoviesLoadData extends UpcomingMoviesEvent {}
