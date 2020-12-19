import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:movie_list_redux/actions/get_movies_filtered.dart';
import 'package:movie_list_redux/data/yts_api.dart';
import 'package:movie_list_redux/actions/get_movies.dart';
import 'package:movie_list_redux/models/app_state.dart';
import 'package:movie_list_redux/models/movie.dart';
import 'package:meta/meta.dart';

class AppMiddleware {
  const AppMiddleware({@required YtsApi ytsApi})
      : assert(ytsApi != null),
        _ytsApi = ytsApi;

  final YtsApi _ytsApi;

  List<Middleware<AppState>> get middleware {
    return <Middleware<AppState>>[
      _getMoviesMiddleware,
      _getMoviesFilteredMiddleware,
    ];
  }

  Future<void> _getMoviesMiddleware(Store<AppState> store, dynamic action, NextDispatcher next) async {
    next(action);
    if (action is! GetMovies) {
      return;
    }
    try {
      final List<Movie> movies = await _ytsApi.getMovies();
      final GetMoviesSuccessful successful = GetMoviesSuccessful(movies);
      store.dispatch(successful);
    } catch (e) {
      final GetMoviesError error = GetMoviesError(e);
      store.dispatch(error);
    }
  }

  Future<void> _getMoviesFilteredMiddleware(Store<AppState> store, dynamic action, NextDispatcher next) async {
    next(action);
    if (action is! GetMoviesFiltered) {
      return;
    }
    try {
      final List<Movie> movies = _filterMovies(action.rating, store.state.movies.toList(), action.lower);
      final GetMoviesFilteredSuccessful successful = GetMoviesFilteredSuccessful(movies);
      store.dispatch(successful);
    } catch (e) {
      final GetMoviesFilteredError error = GetMoviesFilteredError(e);
      store.dispatch(error);
    }
  }

  List<Movie> _filterMovies(double rating, List<Movie> movies, bool lower) {
    List<dynamic> filteredMovies;
    if (lower) {
      filteredMovies = movies //
          .where((dynamic element) => double.tryParse(element.rating.toString()) <= rating)
          .toList();
    } else {
      filteredMovies = movies //
          .where((dynamic element) => double.tryParse(element.rating.toString()) >= rating)
          .toList();
    }
    return filteredMovies;
  }
}
