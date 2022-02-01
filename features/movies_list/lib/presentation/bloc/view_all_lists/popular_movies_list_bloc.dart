import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:movies_list/domain/domain.dart';
import 'package:movies_list/domain/usecases/movies_usecase.dart';
import 'package:movies_list/presentation/bloc/view_all_lists/throttle_dropabble.dart';

part 'popular_movies_list_event.dart';
part 'popular_movies_list_state.dart';

class PopularMoviesListBloc
    extends Bloc<PopularMoviesListEvent, PopularMoviesListState> {
  final MoviesUseCase moviesUseCase;
  PopularMoviesListBloc({required this.moviesUseCase})
      : super(const PopularMoviesListState()) {
    on<PopularMoviesListFetched>(
      _onMoviesFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onMoviesFetched(
    PopularMoviesListFetched event,
    Emitter<PopularMoviesListState> emit,
  ) async {
    try {
      double nextPage = state.currentPage + 1;
      if (state.status == PopularMoviesStatus.initial) {
        Map<String, dynamic> apiCallResult =
            await moviesUseCase.getPopularMovies(nextPage.toInt());
        return emit(
          state.copyWith(
            status: PopularMoviesStatus.success,
            currentPage: nextPage,
            totalPages: (apiCallResult["totalPages"] as int).toDouble(),
            movies: apiCallResult["movies"],
          ),
        );
      } else {
        if (nextPage == state.totalPages) {
          Map<String, dynamic> apiCallResult =
              await moviesUseCase.getPopularMovies(nextPage.toInt());
          return emit(
            state.copyWith(
              status: PopularMoviesStatus.success,
              currentPage: nextPage,
              totalPages: (apiCallResult["totalPages"] as int).toDouble(),
              movies: List.of(state.movies)..addAll(apiCallResult["movies"]),
            ),
          );
        } else {
          return emit(state.copyWith(status: PopularMoviesStatus.maxed));
        }
      }
    } catch (e) {
      emit(state.copyWith(status: PopularMoviesStatus.failure));
    }
  }
}
