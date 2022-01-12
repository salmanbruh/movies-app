part of 'top_rated_movies_list_bloc.dart';

enum TopRatedMoviesStatus { initial, success, failure, maxed }

class TopRatedMoviesListState extends Equatable {
  final TopRatedMoviesStatus status;
  final double currentPage;
  final double totalPages;
  final List<MovieEntity> movies;

  const TopRatedMoviesListState({
    this.status = TopRatedMoviesStatus.initial,
    this.currentPage = 0,
    this.totalPages = double.infinity,
    this.movies = const <MovieEntity>[],
  });

  TopRatedMoviesListState copyWith({
    TopRatedMoviesStatus? status,
    double? currentPage,
    double? totalPages,
    List<MovieEntity>? movies,
  }) =>
      TopRatedMoviesListState(
        status: status ?? this.status,
        currentPage: currentPage ?? this.currentPage,
        totalPages: totalPages ?? this.totalPages,
        movies: movies ?? this.movies,
      );

  @override
  List<Object?> get props => [
        status,
        currentPage,
        totalPages,
        movies,
      ];
}
