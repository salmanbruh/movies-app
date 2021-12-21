import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  PopularMoviesBloc() : super(PopularMoviesInitial()) {
    on<PopularMoviesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
