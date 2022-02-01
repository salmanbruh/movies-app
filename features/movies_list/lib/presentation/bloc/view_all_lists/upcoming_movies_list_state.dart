part of 'upcoming_movies_list_bloc.dart';

enum UpcomingMoviesStatus { initial, success, failure, maxed }

class UpcomingMoviesListState extends Equatable {
  final UpcomingMoviesStatus status;
  final double currentPage;
  final double totalPages;
  final List<MovieEntity> movies;

  const UpcomingMoviesListState({
    this.status = UpcomingMoviesStatus.initial,
    this.currentPage = 0,
    this.totalPages = double.infinity,
    this.movies = const <MovieEntity>[],
  });

  UpcomingMoviesListState copyWith({
    UpcomingMoviesStatus? status,
    double? currentPage,
    double? totalPages,
    List<MovieEntity>? movies,
  }) =>
      UpcomingMoviesListState(
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
