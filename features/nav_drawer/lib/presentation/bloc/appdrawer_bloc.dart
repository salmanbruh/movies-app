import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'appdrawer_event.dart';
part 'appdrawer_state.dart';

class AppdrawerBloc extends Bloc<AppdrawerEvent, AppdrawerState> {
  AppdrawerBloc() : super(AppdrawerState.moviesListPage);

  @override
  Stream<AppdrawerState> mapEventToState(AppdrawerEvent event) async* {
    if (event is MoviesListPageEvent) {
      yield AppdrawerState.moviesListPage;
    } else if (event is FavoritesPageEvent) {
      yield AppdrawerState.favoritesPage;
    }
  }
}
