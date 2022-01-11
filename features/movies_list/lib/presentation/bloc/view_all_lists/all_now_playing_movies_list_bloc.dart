import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:movies_list/domain/domain.dart';
import 'package:movies_list/domain/usecases/movies_usecase.dart';
import 'package:stream_transform/stream_transform.dart';

part 'all_now_playing_movies_list_event.dart';
part 'all_now_playing_movies_list_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class AllNowPlayingMoviesListBloc
    extends Bloc<AllNowPlayingMoviesListEvent, AllNowPlayingMoviesListState> {
  final MoviesUseCase moviesUseCase;
  AllNowPlayingMoviesListBloc({required this.moviesUseCase})
      : super(const AllNowPlayingMoviesListState()) {
    on<AllNowPlayingMoviesListFetched>(
      _onMoviesFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onMoviesFetched(
    AllNowPlayingMoviesListFetched event,
    Emitter<AllNowPlayingMoviesListState> emit,
  ) async {
    try {
      double nextPage = state.currentPage + 1;
      if (state.status == AllNowPlayingMoviesStatus.initial) {
        Map<String, dynamic> apiCallResult =
            await moviesUseCase.getNowPlayingMovies(nextPage.toInt());
        return emit(
          state.copyWith(
            status: AllNowPlayingMoviesStatus.success,
            movies: apiCallResult["movies"],
            currentPage: nextPage,
            totalPages: (apiCallResult["totalPages"] as int).toDouble(),
          ),
        );
      } else {
        if (nextPage <= state.totalPages) {
          Map<String, dynamic> apiCallResult =
              await moviesUseCase.getNowPlayingMovies(nextPage.toInt());
          return emit(
            state.copyWith(
              status: AllNowPlayingMoviesStatus.success,
              movies: List.of(state.movies)..addAll(apiCallResult["movies"]),
              currentPage: nextPage,
              totalPages: (apiCallResult["totalPages"] as int).toDouble(),
            ),
          );
        } else {
          return emit(
            state.copyWith(status: AllNowPlayingMoviesStatus.maxed),
          );
        }
      }
    } catch (e) {
      emit(state.copyWith(status: AllNowPlayingMoviesStatus.failure));
    }
  }
}
