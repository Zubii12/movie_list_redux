import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movie_list_redux/actions/get_movies.dart';
import 'package:movie_list_redux/actions/get_movies_filtered.dart';
import 'package:movie_list_redux/containers/movies_container.dart';
import 'package:movie_list_redux/models/app_state.dart';
import 'package:movie_list_redux/models/movie.dart';

import 'movie_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int _listLength = 9;
  double _rating;

  String _validateInput(String value) {
    double rating;
    if (value.isEmpty) {
      _rating = 0.0;
      return 'Please enter the rating';
    } else {
      try {
        rating = double.parse(value);
        if (rating < 0 || rating > 10) {
          _rating = 0.0;
          return 'Please enter an rating between 0 and 10';
        }
      } on FormatException {
        _rating = 0.0;
        return 'Please enter an valid rating';
      }
      _rating = rating;
      return null;
    }
  }

  Future<void> _askedToLead() async {
    switch (await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return Form(
          key: _formKey,
          child: SimpleDialog(
            backgroundColor: Colors.black,
            title: const Center(
              child: Text(
                'Filtering by rating',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                    fillColor: Color(0xFF303030),
                    filled: true,
                    hintText: 'Enter the rating',
                    hintStyle: TextStyle(
                      color: Color(0xFFD6D6D6),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (String value) {
                    return _validateInput(value);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: const Color(0xFF303030),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Navigator.pop<String>(context, 'lower');
                    }
                  },
                  child: const Text('Lower than rating received'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: const Color(0xFF303030),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Navigator.pop<String>(context, 'higher');
                    }
                  },
                  child: const Text('Higher than rating received'),
                ),
              ),
            ],
          ),
        );
      },
    )) {
      case 'lower':
        setState(() {
          StoreProvider.of<AppState>(context) //
              .dispatch(GetMoviesFiltered(_rating, true));
          _listLength = 0;
        });
        break;
      case 'higher':
        setState(() {
          StoreProvider.of<AppState>(context) //
              .dispatch(GetMoviesFiltered(_rating, false));
          _listLength = 0;
        });
        break;
    }
  }

  dynamic _getCover(Movie movie) {
    try {
      return Image.network(
        movie.mediumCover,
        fit: BoxFit.fill,
        errorBuilder: (BuildContext context, Object error, StackTrace stackTrace) {
          return const Icon(Icons.error);
        },
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                  : null,
            ),
          );
        },
      );
    } on NoSuchMethodError {
      return const Icon(Icons.error);
    }
  }

  void _resetMovies() {
    setState(() {
      StoreProvider.of<AppState>(context) //
          .dispatch(const GetMovies());
      _listLength = 9;
    });
  }

  @override
  void initState() {
    super.initState();
    _listLength = 9;
  }

  @override
  Widget build(BuildContext context) {
    return MoviesContainer(
      builder: (BuildContext context, List<Movie> movies) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(widget.title),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.filter_alt_outlined),
                onPressed: () {
                  _askedToLead();
                },
              ),
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  _resetMovies();
                },
              )
            ],
          ),
          body: GridView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: _listLength == 9 ? _listLength : movies.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (BuildContext context, int index) {
              Movie movie;
              movies.length >= _listLength ? movie = movies[index] : movie = null;
              return Card(
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    Navigator.push<dynamic>(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (BuildContext context) => MoviePage(movie: movie),
                      ),
                    );
                  },
                  child: _getCover(movie),
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            tooltip: 'Show more movies',
            backgroundColor: const Color(0xFF303030),
            onPressed: () {
              setState(
                () {
                  StoreProvider.of<AppState>(context) //
                      .dispatch(const GetMovies());
                  _listLength = 0;
                },
              );
            },
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }
}
