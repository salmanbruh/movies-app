part of 'all_now_playing_movies_list_bloc.dart';

@immutable
abstract class AllNowPlayingMoviesListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AllNowPlayingMoviesListFetched extends AllNowPlayingMoviesListEvent {}
