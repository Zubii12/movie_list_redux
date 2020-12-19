import 'package:movie_list_redux/models/movie.dart';

class GetMoviesFiltered {
  const GetMoviesFiltered(this.rating, this.lower);

  final double rating;
  final bool lower;
}

class GetMoviesFilteredSuccessful {
  const GetMoviesFilteredSuccessful(this.movies);

  final List<Movie> movies;
}

class GetMoviesFilteredError {
  const GetMoviesFilteredError(this.error);

  final dynamic error;
}
