import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_list/domain/entities/movies_entity.dart';
import 'package:movies_list/domain/usecases/movies_usecase.dart';

part 'now_playing_movies_event.dart';
part 'now_playing_movies_state.dart';

class NowPlayingMoviesBloc
    extends Bloc<NowPlayingMoviesEvent, NowPlayingMoviesState> {
  final MoviesUseCase moviesUseCase;

  NowPlayingMoviesBloc({
    required this.moviesUseCase,
  }) : super(NowPlayingMoviesInitial());

  @override
  Stream<NowPlayingMoviesState> mapEventToState(
      NowPlayingMoviesEvent event) async* {
    if (event is NowPlayingMoviesLoadData) {
      yield* _loadNowPlayingMovies();
    }
  }

  Stream<NowPlayingMoviesState> _loadNowPlayingMovies() async* {
    try {
      yield NowPlayingMoviesLoading();
      List<MovieEntity> movies =
          await moviesUseCase.getNowPlayingMovies(1) as List<MovieEntity>;
      if (movies.isEmpty) {
        yield NowPlayingMoviesNoData(message: "No Data");
      } else {
        yield NowPlayingMoviesHasData(data: movies);
      }
    } on IOException {
      yield NowPlayingMoviesNoInternetConnection(
          message: "No Internet Connection");
    } on TimeoutException {
      yield NowPlayingMoviesNoInternetConnection(
          message: "No Internet Connection");
    } catch (e) {
      yield NowPlayingMoviesError(message: e.toString());
    }
  }
}
