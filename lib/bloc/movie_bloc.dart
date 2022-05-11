import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:stream_transform/stream_transform.dart';
import '../model/movies_model.dart';
import '../Service/get_movies_service.dart';

part 'movie_event.dart';
part 'movie_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc({required this.httpClient}) : super(const MovieState()) {
    on<MovieFetched>(
      _onMovieFetched,
      transformer: throttleDroppable(throttleDuration),
    );
    on<MovieSelected>(_mapSelectMovieEventToState);
  }

  final http.Client httpClient;

  Future<void> _onMovieFetched(
    MovieFetched event,
    Emitter<MovieState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == MovieStatus.initial) {
        final movies = await _fetchMovies();
        return emit(state.copyWith(
          status: MovieStatus.success,
          movies: movies,
          hasReachedMax: false,
        ));
      } else if (state.status == MovieStatus.selected) {}
      final movies = await _fetchMovies();
      movies.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: MovieStatus.success,
                movies: List.of(state.movies)..addAll(movies),
                hasReachedMax: false,
              ),
            );
    } catch (_) {
      emit(state.copyWith(status: MovieStatus.failure));
    }
  }

  Future<List<Result>> _fetchMovies() async {
    return GetMovieService().getMovies();
  }

  void _mapSelectMovieEventToState(
      MovieSelected event, Emitter<MovieState> emit) async {
    emit(
      state.copyWith(
        status: MovieStatus.selected,
        idSelected: event.idSelected,
      ),
    );
  }
}
