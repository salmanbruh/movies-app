import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:movies_list/domain/domain.dart';
import 'package:movies_list/domain/usecases/movies_usecase.dart';
import 'package:movies_list/presentation/bloc/view_all_lists/throttle_dropabble.dart';

part 'top_rated_movies_list_event.dart';
part 'top_rated_movies_list_state.dart';

class TopRatedMoviesListBloc
    extends Bloc<TopRatedMoviesListEvent, TopRatedMoviesListState> {
  final MoviesUseCase moviesUseCase;
  TopRatedMoviesListBloc({required this.moviesUseCase})
      : super(const TopRatedMoviesListState()) {
    on<TopRatedMoviesListFetched>(
      _onMoviesFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onMoviesFetched(
    TopRatedMoviesListFetched event,
    Emitter<TopRatedMoviesListState> emit,
  ) async {
    try {
      double nextPage = state.currentPage + 1;
      if (state.status == TopRatedMoviesStatus.initial) {
        Map<String, dynamic> apiCallResult =
            await moviesUseCase.getTopRatedMovies(nextPage.toInt());
        return emit(
          state.copyWith(
            status: TopRatedMoviesStatus.success,
            currentPage: nextPage,
            totalPages: (apiCallResult["totalPages"] as int).toDouble(),
            movies: apiCallResult["movies"],
          ),
        );
      } else {
        if (nextPage <= state.totalPages) {
          Map<String, dynamic> apiCallResult =
              await moviesUseCase.getTopRatedMovies(nextPage.toInt());
          return emit(
            state.copyWith(
              status: TopRatedMoviesStatus.success,
              currentPage: nextPage,
              totalPages: (apiCallResult["totalPages"] as int).toDouble(),
              movies: List.of(state.movies)..addAll(apiCallResult["movies"]),
            ),
          );
        } else {
          return emit(state.copyWith(status: TopRatedMoviesStatus.maxed));
        }
      }
    } catch (e) {
      emit(state.copyWith(status: TopRatedMoviesStatus.failure));
    }
  }
}
