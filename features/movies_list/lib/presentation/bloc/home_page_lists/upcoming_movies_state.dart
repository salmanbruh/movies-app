part of 'upcoming_movies_bloc.dart';

abstract class UpcomingMoviesState extends Equatable {
  @override
  List<Object> get props => [];
}

class UpcomingMoviesInitial extends UpcomingMoviesState {}

class UpcomingMoviesLoading extends UpcomingMoviesState {}

class UpcomingMoviesNoData extends UpcomingMoviesState {
  final String message;

  UpcomingMoviesNoData({required this.message});

  @override
  List<Object> get props => [message];
}

class UpcomingMoviesHasData extends UpcomingMoviesState {
  final List<MovieEntity> data;

  UpcomingMoviesHasData({required this.data});

  @override
  List<Object> get props => [data];
}

class UpcomingMoviesNoInternetConnection extends UpcomingMoviesState {
  final String message;

  UpcomingMoviesNoInternetConnection({required this.message});

  @override
  List<Object> get props => [message];
}

class UpcomingMoviesError extends UpcomingMoviesState {
  final String message;

  UpcomingMoviesError({required this.message});

  @override
  List<Object> get props => [message];
}
