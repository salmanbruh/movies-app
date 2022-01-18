import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:movies_list/domain/domain.dart';
import 'package:movies_list/domain/usecases/movies_usecase.dart';
import 'package:movies_list/presentation/bloc/blocs.dart'
    show throttleDroppable, throttleDuration;

part 'search_movie_event.dart';
part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final MoviesUseCase moviesUseCase;
  SearchMovieBloc({required this.moviesUseCase})
      : super(const SearchMovieState()) {
    on<Search>(
      _onSearch,
      transformer: throttleDroppable(throttleDuration),
    );
    on<LoadNextResults>(
      _onLoadNextResults,
      transformer: throttleDroppable(throttleDuration),
    );
    on<Clear>(
      _onClear,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onSearch(
    Search event,
    Emitter<SearchMovieState> emit,
  ) async {
    try {
      if (state.query != event.query) {
        emit(const SearchMovieState());
        double nextPage = 1;
        Map<String, dynamic> apiCallResult =
            await moviesUseCase.searchMovie(event.query, nextPage.toInt());
        emit(
          state.copyWith(
            status: SearchMovieStatus.success,
            query: event.query,
            currentPage: nextPage,
            totalPages: (apiCallResult["totalPages"] as int).toDouble(),
            movies: apiCallResult["movies"],
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(status: SearchMovieStatus.failure));
    }
  }

  Future<void> _onLoadNextResults(
    LoadNextResults event,
    Emitter<SearchMovieState> emit,
  ) async {
    try {
      if (state.query != "") {
        double nextPage = state.currentPage + 1;
        Map<String, dynamic> apiCallResult = await moviesUseCase.searchMovie(
          state.query,
          nextPage.toInt(),
        );
        emit(
          state.copyWith(
            status: SearchMovieStatus.success,
            currentPage: nextPage,
            totalPages: (apiCallResult["totalPages"] as int).toDouble(),
            movies: List.of(state.movies)..addAll(apiCallResult["movies"]),
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(status: SearchMovieStatus.failure));
    }
  }

  Future<void> _onClear(
    Clear event,
    Emitter<SearchMovieState> emit,
  ) async {
    return emit(const SearchMovieState());
  }
}
