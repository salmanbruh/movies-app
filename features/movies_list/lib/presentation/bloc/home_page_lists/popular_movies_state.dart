part of 'popular_movies_bloc.dart';

abstract class PopularMoviesState extends Equatable {
  @override
  List<Object> get props => [];
}

class PopularMoviesInitial extends PopularMoviesState {}

class PopularMoviesLoading extends PopularMoviesState {}

class PopularMoviesNoData extends PopularMoviesState {
  final String message;

  PopularMoviesNoData({required this.message});

  @override
  List<Object> get props => [message];
}

class PopularMoviesHasData extends PopularMoviesState {
  final List<MovieEntity> data;

  PopularMoviesHasData({required this.data});

  @override
  List<Object> get props => [data];
}

class PopularMoviesNoInternetConnection extends PopularMoviesState {
  final String message;

  PopularMoviesNoInternetConnection({required this.message});

  @override
  List<Object> get props => [message];
}

class PopularMoviesError extends PopularMoviesState {
  final String message;

  PopularMoviesError({required this.message});

  @override
  List<Object> get props => [message];
}
