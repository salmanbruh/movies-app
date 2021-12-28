import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_list/domain/domain.dart' show MovieEntity;
import 'package:movies_list/domain/usecases/movies_usecase.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final MoviesUseCase _moviesUseCase;

  MovieDetailsCubit(this._moviesUseCase) : super(const MovieDetailsState());

  Future<void> fetchMovieDetails(int movieId) async {
    emit(state.copyWith(status: MovieDetailsStatus.loading));

    try {
      final movie = await _moviesUseCase.getMovieDetails(movieId);
      emit(state.copyWith(status: MovieDetailsStatus.success, movie: movie));
    } on Exception {
      emit(state.copyWith(status: MovieDetailsStatus.failure));
    }
  }
}
