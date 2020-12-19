import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:movie_list_redux/models/app_state.dart';
import 'package:movie_list_redux/models/movie.dart';

class MoviesContainer extends StatelessWidget {
  const MoviesContainer({Key key, @required this.builder}) : super(key: key);

  final ViewModelBuilder<List<Movie>> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<Movie>>(
      builder: builder,
      converter: (Store<AppState> store) => store.state.movies.asList(),
    );
  }
}
