// GENERATED CODE - DO NOT MODIFY BY HAND

part of movie;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Movie> _$movieSerializer = new _$MovieSerializer();

class _$MovieSerializer implements StructuredSerializer<Movie> {
  @override
  final Iterable<Type> types = const [Movie, _$Movie];
  @override
  final String wireName = 'Movie';

  @override
  Iterable<Object> serialize(Serializers serializers, Movie object, {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'title',
      serializers.serialize(object.title, specifiedType: const FullType(String)),
      'year',
      serializers.serialize(object.year, specifiedType: const FullType(int)),
      'rating',
      serializers.serialize(object.rating, specifiedType: const FullType(num)),
      'genres',
      serializers.serialize(object.genres, specifiedType: const FullType(BuiltList, const [const FullType(String)])),
      'medium_cover_image',
      serializers.serialize(object.mediumCover, specifiedType: const FullType(String)),
      'large_cover_image',
      serializers.serialize(object.largeCover, specifiedType: const FullType(String)),
      'summary',
      serializers.serialize(object.summary, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Movie deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MovieBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
        case 'year':
          result.year = serializers.deserialize(value, specifiedType: const FullType(int)) as int;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value, specifiedType: const FullType(num)) as num;
          break;
        case 'genres':
          result.genres.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [const FullType(String)])) as BuiltList<Object>);
          break;
        case 'medium_cover_image':
          result.mediumCover = serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
        case 'large_cover_image':
          result.largeCover = serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
        case 'summary':
          result.summary = serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Movie extends Movie {
  @override
  final String title;
  @override
  final int year;
  @override
  final num rating;
  @override
  final BuiltList<String> genres;
  @override
  final String mediumCover;
  @override
  final String largeCover;
  @override
  final String summary;

  factory _$Movie([void Function(MovieBuilder) updates]) => (new MovieBuilder()..update(updates)).build();

  _$Movie._({this.title, this.year, this.rating, this.genres, this.mediumCover, this.largeCover, this.summary})
      : super._() {
    if (title == null) {
      throw new BuiltValueNullFieldError('Movie', 'title');
    }
    if (year == null) {
      throw new BuiltValueNullFieldError('Movie', 'year');
    }
    if (rating == null) {
      throw new BuiltValueNullFieldError('Movie', 'rating');
    }
    if (genres == null) {
      throw new BuiltValueNullFieldError('Movie', 'genres');
    }
    if (mediumCover == null) {
      throw new BuiltValueNullFieldError('Movie', 'mediumCover');
    }
    if (largeCover == null) {
      throw new BuiltValueNullFieldError('Movie', 'largeCover');
    }
    if (summary == null) {
      throw new BuiltValueNullFieldError('Movie', 'summary');
    }
  }

  @override
  Movie rebuild(void Function(MovieBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  MovieBuilder toBuilder() => new MovieBuilder()..replace(this);

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Movie &&
        title == other.title &&
        year == other.year &&
        rating == other.rating &&
        genres == other.genres &&
        mediumCover == other.mediumCover &&
        largeCover == other.largeCover &&
        summary == other.summary;
  }

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc($jc(0, title.hashCode), year.hashCode), rating.hashCode), genres.hashCode),
                mediumCover.hashCode),
            largeCover.hashCode),
        summary.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Movie')
          ..add('title', title)
          ..add('year', year)
          ..add('rating', rating)
          ..add('genres', genres)
          ..add('mediumCover', mediumCover)
          ..add('largeCover', largeCover)
          ..add('summary', summary))
        .toString();
  }
}

class MovieBuilder implements Builder<Movie, MovieBuilder> {
  _$Movie _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  int _year;
  int get year => _$this._year;
  set year(int year) => _$this._year = year;

  num _rating;
  num get rating => _$this._rating;
  set rating(num rating) => _$this._rating = rating;

  ListBuilder<String> _genres;
  ListBuilder<String> get genres => _$this._genres ??= new ListBuilder<String>();
  set genres(ListBuilder<String> genres) => _$this._genres = genres;

  String _mediumCover;
  String get mediumCover => _$this._mediumCover;
  set mediumCover(String mediumCover) => _$this._mediumCover = mediumCover;

  String _largeCover;
  String get largeCover => _$this._largeCover;
  set largeCover(String largeCover) => _$this._largeCover = largeCover;

  String _summary;
  String get summary => _$this._summary;
  set summary(String summary) => _$this._summary = summary;

  MovieBuilder();

  MovieBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _year = _$v.year;
      _rating = _$v.rating;
      _genres = _$v.genres?.toBuilder();
      _mediumCover = _$v.mediumCover;
      _largeCover = _$v.largeCover;
      _summary = _$v.summary;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Movie other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Movie;
  }

  @override
  void update(void Function(MovieBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Movie build() {
    _$Movie _$result;
    try {
      _$result = _$v ??
          new _$Movie._(
              title: title,
              year: year,
              rating: rating,
              genres: genres.build(),
              mediumCover: mediumCover,
              largeCover: largeCover,
              summary: summary);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'genres';
        genres.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError('Movie', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
