part of 'all_now_playing_movies_list_bloc.dart';

enum AllNowPlayingMoviesStatus { initial, success, failure, maxed }

class AllNowPlayingMoviesListState extends Equatable {
  const AllNowPlayingMoviesListState({
    this.status = AllNowPlayingMoviesStatus.initial,
    this.movies = const <MovieEntity>[],
    this.currentPage = 0,
    this.totalPages = double.infinity,
  });

  final AllNowPlayingMoviesStatus status;
  final List<MovieEntity> movies;
  final double currentPage;
  final double totalPages;

  AllNowPlayingMoviesListState copyWith({
    AllNowPlayingMoviesStatus? status,
    List<MovieEntity>? movies,
    double? currentPage,
    double? totalPages,
  }) {
    return AllNowPlayingMoviesListState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
    );
  }

  @override
  List<Object> get props => [
        status,
        movies,
        currentPage,
        totalPages,
      ];
}
