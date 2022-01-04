import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_list/domain/entities/movies_entity.dart';
import 'package:movies_list/domain/usecases/movies_usecase.dart';

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final MoviesUseCase moviesUseCase;

  PopularMoviesBloc({
    required this.moviesUseCase,
  }) : super(PopularMoviesInitial());

  @override
  Stream<PopularMoviesState> mapEventToState(PopularMoviesEvent event) async* {
    if (event is PopularMoviesLoadData) {
      yield* _loadPopularMovies();
    }
  }

  Stream<PopularMoviesState> _loadPopularMovies() async* {
    try {
      yield PopularMoviesLoading();
      List<MovieEntity> movies =
          await moviesUseCase.getPopularMovies(1) as List<MovieEntity>;
      if (movies.isEmpty) {
        yield PopularMoviesNoData(message: "No Data");
      } else {
        yield PopularMoviesHasData(data: movies);
      }
    } on IOException {
      yield PopularMoviesNoInternetConnection(
          message: "No Internet Connection");
    } on TimeoutException {
      yield PopularMoviesNoInternetConnection(
          message: "No Internet Connection");
    } catch (e) {
      yield PopularMoviesError(message: e.toString());
    }
  }
}
