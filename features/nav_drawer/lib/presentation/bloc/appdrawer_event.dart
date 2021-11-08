part of 'appdrawer_bloc.dart';

@immutable
abstract class AppdrawerEvent extends Equatable {
  const AppdrawerEvent();

  @override
  List<Object> get props => [];
}

class MoviesListPageEvent extends AppdrawerEvent {}

class FavoritesPageEvent extends AppdrawerEvent {}
