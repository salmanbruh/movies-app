part of 'top_rated_movies_bloc.dart';

abstract class TopRatedMoviesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class TopRatedMoviesLoadData extends TopRatedMoviesEvent {}
