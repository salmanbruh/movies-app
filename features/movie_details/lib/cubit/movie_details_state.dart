part of 'movie_details_cubit.dart';

enum MovieDetailsStatus { initial, loading, success, failure }

extension MovieDetailsStatusX on MovieDetailsStatus {
  bool get isInitial => this == MovieDetailsStatus.initial;
  bool get isLoading => this == MovieDetailsStatus.loading;
  bool get isSuccess => this == MovieDetailsStatus.success;
  bool get isFailure => this == MovieDetailsStatus.failure;
}

class MovieDetailsState extends Equatable {
  final MovieDetailsStatus status;
  final MovieEntity? movie;

  const MovieDetailsState({
    this.status = MovieDetailsStatus.initial,
    this.movie,
  });

  MovieDetailsState copyWith({
    MovieDetailsStatus? status,
    MovieEntity? movie,
  }) =>
      MovieDetailsState(
        status: status ?? this.status,
        movie: movie ?? this.movie,
      );

  @override
  List<Object?> get props => [status, movie];
}
