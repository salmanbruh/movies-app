part of 'top_rated_movies_bloc.dart';

abstract class TopRatedMoviesState extends Equatable {
  @override
  List<Object> get props => [];
}

class TopRatedMoviesInitial extends TopRatedMoviesState {}

class TopRatedMoviesLoading extends TopRatedMoviesState {}

class TopRatedMoviesNoData extends TopRatedMoviesState {
  final String message;

  TopRatedMoviesNoData({required this.message});

  @override
  List<Object> get props => [message];
}

class TopRatedMoviesHasData extends TopRatedMoviesState {
  final List<MovieEntity> data;

  TopRatedMoviesHasData({required this.data});

  @override
  List<Object> get props => [data];
}

class TopRatedMoviesNoInternetConnection extends TopRatedMoviesState {
  final String message;

  TopRatedMoviesNoInternetConnection({required this.message});

  @override
  List<Object> get props => [message];
}

class TopRatedMoviesError extends TopRatedMoviesState {
  final String message;

  TopRatedMoviesError({required this.message});

  @override
  List<Object> get props => [message];
}
