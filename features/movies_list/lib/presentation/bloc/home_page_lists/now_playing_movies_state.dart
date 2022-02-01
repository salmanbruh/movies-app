part of 'now_playing_movies_bloc.dart';

abstract class NowPlayingMoviesState extends Equatable {
  @override
  List<Object> get props => [];
}

class NowPlayingMoviesInitial extends NowPlayingMoviesState {}

class NowPlayingMoviesLoading extends NowPlayingMoviesState {}

class NowPlayingMoviesNoData extends NowPlayingMoviesState {
  final String message;

  NowPlayingMoviesNoData({required this.message});

  @override
  List<Object> get props => [message];
}

class NowPlayingMoviesHasData extends NowPlayingMoviesState {
  final List<MovieEntity> data;

  NowPlayingMoviesHasData({required this.data});

  @override
  List<Object> get props => [data];
}

class NowPlayingMoviesNoInternetConnection extends NowPlayingMoviesState {
  final String message;

  NowPlayingMoviesNoInternetConnection({required this.message});

  @override
  List<Object> get props => [message];
}

class NowPlayingMoviesError extends NowPlayingMoviesState {
  final String message;

  NowPlayingMoviesError({required this.message});

  @override
  List<Object> get props => [message];
}
