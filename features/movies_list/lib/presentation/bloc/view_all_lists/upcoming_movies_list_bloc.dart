import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:movies_list/domain/domain.dart';
import 'package:movies_list/domain/usecases/movies_usecase.dart';
import 'package:movies_list/presentation/bloc/view_all_lists/throttle_dropabble.dart';

part 'upcoming_movies_list_event.dart';
part 'upcoming_movies_list_state.dart';

class UpcomingMoviesListBloc
    extends Bloc<UpcomingMoviesListEvent, UpcomingMoviesListState> {
  final MoviesUseCase moviesUseCase;
  UpcomingMoviesListBloc({required this.moviesUseCase})
      : super(const UpcomingMoviesListState()) {
    on<UpcomingMoviesListFetched>(
      _onMoviesFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onMoviesFetched(
    UpcomingMoviesListFetched event,
    Emitter<UpcomingMoviesListState> emit,
  ) async {
    try {
      double nextPage = state.currentPage + 1;
      if (state.status == UpcomingMoviesStatus.initial) {
        Map<String, dynamic> apiCallResult =
            await moviesUseCase.getUpcomingMovies(nextPage.toInt());
        return emit(
          state.copyWith(
            status: UpcomingMoviesStatus.success,
            currentPage: nextPage,
            totalPages: (apiCallResult["totalPages"] as int).toDouble(),
            movies: apiCallResult["movies"],
          ),
        );
      } else {
        if (nextPage <= state.totalPages) {
          Map<String, dynamic> apiCallResult =
              await moviesUseCase.getUpcomingMovies(nextPage.toInt());
          return emit(
            state.copyWith(
              status: UpcomingMoviesStatus.success,
              currentPage: nextPage,
              totalPages: (apiCallResult["totalPages"] as int).toDouble(),
              movies: List.of(state.movies)..addAll(apiCallResult["movies"]),
            ),
          );
        } else {
          return emit(state.copyWith(status: UpcomingMoviesStatus.maxed));
        }
      }
    } catch (e) {
      emit(state.copyWith(status: UpcomingMoviesStatus.failure));
    }
  }
}
