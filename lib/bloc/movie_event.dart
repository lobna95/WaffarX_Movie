part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class MovieFetched extends MovieEvent {}

class MovieSelected extends MovieEvent {
  MovieSelected({
    required this.idSelected,
  });
  final int idSelected;

  @override
  List<Object> get props => [idSelected];
}
