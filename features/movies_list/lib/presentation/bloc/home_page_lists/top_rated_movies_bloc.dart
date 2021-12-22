import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_list/domain/entities/movies_entity.dart';
import 'package:movies_list/domain/usecases/movies_usecase.dart';

part 'top_rated_movies_event.dart';
part 'top_rated_movies_state.dart';

class TopRatedMoviesBloc
    extends Bloc<TopRatedMoviesEvent, TopRatedMoviesState> {
  final MoviesUseCase moviesUseCase;

  TopRatedMoviesBloc({
    required this.moviesUseCase,
  }) : super(TopRatedMoviesInitial());

  @override
  Stream<TopRatedMoviesState> mapEventToState(
      TopRatedMoviesEvent event) async* {
    if (event is TopRatedMoviesLoadData) {
      yield* _loadTopRatedMovies();
    }
  }

  Stream<TopRatedMoviesState> _loadTopRatedMovies() async* {
    try {
      yield TopRatedMoviesLoading();
      var movies = await moviesUseCase.getTopRatedMovies(1);
      if (movies.isEmpty) {
        yield TopRatedMoviesNoData(message: "No Data");
      } else {
        yield TopRatedMoviesHasData(data: movies);
      }
    } on IOException {
      yield TopRatedMoviesNoInternetConnection(
          message: "No Internet Connection");
    } on TimeoutException {
      yield TopRatedMoviesNoInternetConnection(
          message: "No Internet Connection");
    } catch (e) {
      yield TopRatedMoviesError(message: e.toString());
    }
  }
}
