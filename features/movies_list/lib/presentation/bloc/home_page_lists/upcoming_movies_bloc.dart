import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_list/domain/entities/movies_entity.dart';
import 'package:movies_list/domain/usecases/movies_usecase.dart';
import 'package:movies_list/presentation/bloc/blocs.dart';

part 'upcoming_movies_event.dart';
part 'upcoming_movies_state.dart';

class UpcomingMoviesBloc
    extends Bloc<UpcomingMoviesEvent, UpcomingMoviesState> {
  final MoviesUseCase moviesUseCase;

  UpcomingMoviesBloc({required this.moviesUseCase})
      : super(UpcomingMoviesInitial());

  @override
  Stream<UpcomingMoviesState> mapEventToState(
      UpcomingMoviesEvent event) async* {
    if (event is LoadData) {
      yield* _loadUpcomingMovies();
    }
  }

  Stream<UpcomingMoviesState> _loadUpcomingMovies() async* {
    try {
      yield UpcomingMoviesLoading();
      var movies = await moviesUseCase.getUpcomingMovies(1);
      if (movies.isEmpty) {
        yield UpcomingMoviesNoData(message: "No Data");
      } else {
        yield UpcomingMoviesHasData(data: movies);
      }
    } on IOException {
      yield UpcomingMoviesNoInternetConnection(
          message: "No Internet Connection");
    } on TimeoutException {
      yield UpcomingMoviesNoInternetConnection(
          message: "No Internet Connection");
    } catch (e) {
      yield UpcomingMoviesError(message: e.toString());
    }
  }
}
