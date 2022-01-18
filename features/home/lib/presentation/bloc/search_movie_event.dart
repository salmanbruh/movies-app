part of 'search_movie_bloc.dart';

@immutable
abstract class SearchMovieEvent extends Equatable {}

class Search extends SearchMovieEvent {
  final String query;

  Search({required this.query});

  @override
  List<Object?> get props => [query];
}

class LoadNextResults extends SearchMovieEvent {
  @override
  List<Object?> get props => [];
}

class Clear extends SearchMovieEvent {
  @override
  List<Object?> get props => [];
}
