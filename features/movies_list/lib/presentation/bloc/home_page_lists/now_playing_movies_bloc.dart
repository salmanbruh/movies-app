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
  }) : super(Initial());

  @override
  Stream<NowPlayingMoviesState> mapEventToState(
      NowPlayingMoviesEvent event) async* {
    if (event is LoadData) {
      yield* _loadNowPlayingMovies();
    }
  }

  Stream<NowPlayingMoviesState> _loadNowPlayingMovies() async* {
    try {
      yield Loading();
      var movies = await moviesUseCase.getNowPlayingMovies(1);
      if (movies.isEmpty) {
        yield NoData(message: "No Data");
      } else {
        yield HasData(data: movies);
      }
    } on IOException {
      yield NoInternetConnection(message: "No Internet Connection");
    } on TimeoutException {
      yield NoInternetConnection(message: "No Internet Connection");
    } catch (e) {
      yield Error(message: e.toString());
    }
  }
}
