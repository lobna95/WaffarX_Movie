part of 'movie_bloc.dart';

enum MovieStatus { initial, success, failure, selected }

class MovieState extends Equatable {
  final MovieStatus status;
  final List<Result> movies;
  final bool hasReachedMax;
  final int idSelected;

  const MovieState(
      {this.status = MovieStatus.initial,
      this.movies = const <Result>[],
      this.hasReachedMax = false,
      this.idSelected = 0});

  MovieState copyWith({
    MovieStatus? status,
    List<Result>? movies,
    bool? hasReachedMax,
    int? idSelected,
  }) {
    return MovieState(
        status: status ?? this.status,
        movies: movies ?? this.movies,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        idSelected: this.idSelected);
  }

  @override
  String toString() {
    return '''MovieState { status: $status, hasReachedMax: $hasReachedMax, movies: ${movies.length} }''';
  }

  @override
  List<Object> get props => [status, movies, hasReachedMax, idSelected];
}
