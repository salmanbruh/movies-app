import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc() : super(MovieDetailsInitial()) {
    on<MovieDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
