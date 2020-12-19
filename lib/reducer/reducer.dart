import 'package:movie_list_redux/actions/get_movies.dart';
import 'package:movie_list_redux/actions/get_movies_filtered.dart';
import 'package:movie_list_redux/models/app_state.dart';

AppState reducer(AppState state, dynamic action) {
  if (action is GetMoviesSuccessful) {
    final AppStateBuilder builder = state.toBuilder();
    if (builder.movies.isNotEmpty) {
      builder.movies.clear();
    }
    builder.movies.addAll(action.movies);
    return builder.build();
  } else if (action is GetMoviesFilteredSuccessful) {
    final AppStateBuilder builder = state.toBuilder();
    if (builder.movies.isNotEmpty) {
      builder.movies.clear();
    }
    builder.movies.addAll(action.movies);
    return builder.build();
  }
  return state;
}
