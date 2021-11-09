import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'now_playing_movies_event.dart';
part 'now_playing_movies_state.dart';

class NowPlayingMoviesBloc extends Bloc<NowPlayingMoviesEvent, NowPlayingMoviesState> {
  NowPlayingMoviesBloc() : super(NowPlayingMoviesInitial()) {
    on<NowPlayingMoviesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
