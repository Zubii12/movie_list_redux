library movie;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'serializers.dart';

part 'movie.g.dart';

abstract class Movie implements Built<Movie, MovieBuilder> {
  factory Movie([void Function(MovieBuilder b) updates]) = _$Movie;

  factory Movie.fromJson(dynamic json) {
    return serializers.deserializeWith(serializer, json);
  }

  Movie._();

  String get title;

  int get year;

  num get rating;

  BuiltList<String> get genres;

  @BuiltValueField(wireName: 'medium_cover_image')
  String get mediumCover;

  @BuiltValueField(wireName: 'large_cover_image')
  String get largeCover;

  String get summary;

  static Serializer<Movie> get serializer => _$movieSerializer;
}
