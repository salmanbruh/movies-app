part of 'search_movie_bloc.dart';

enum SearchMovieStatus { initial, success, failure, maxed }

class SearchMovieState extends Equatable {
  final SearchMovieStatus status;
  final String query;
  final double currentPage;
  final double totalPages;
  final List<MovieEntity> movies;

  const SearchMovieState({
    this.status = SearchMovieStatus.initial,
    this.query = "",
    this.currentPage = 0,
    this.totalPages = double.infinity,
    this.movies = const <MovieEntity>[],
  });

  SearchMovieState copyWith({
    SearchMovieStatus? status,
    String? query,
    double? currentPage,
    double? totalPages,
    List<MovieEntity>? movies,
  }) =>
      SearchMovieState(
        status: status ?? this.status,
        query: query ?? this.query,
        currentPage: currentPage ?? this.currentPage,
        totalPages: totalPages ?? this.totalPages,
        movies: movies ?? this.movies,
      );

  @override
  List<Object?> get props => [status, query, currentPage, totalPages, movies];
}
