part of 'popular_movies_list_bloc.dart';

enum PopularMoviesStatus { initial, success, failure, maxed }

class PopularMoviesListState extends Equatable {
  final PopularMoviesStatus status;
  final double currentPage;
  final double totalPages;
  final List<MovieEntity> movies;

  const PopularMoviesListState({
    this.status = PopularMoviesStatus.initial,
    this.currentPage = 0,
    this.totalPages = double.infinity,
    this.movies = const <MovieEntity>[],
  });

  PopularMoviesListState copyWith({
    PopularMoviesStatus? status,
    double? currentPage,
    double? totalPages,
    List<MovieEntity>? movies,
  }) =>
      PopularMoviesListState(
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
