// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileModel {
  String get id;
  String get pseudo;
  String get sex;
  int get age;
  String get country;
  String get city;
  List<String> get interests;
  @TimestampConverter()
  Timestamp get createdDate;
  String get imgURL;
  String get description;

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileModelCopyWith<ProfileModel> get copyWith =>
      _$ProfileModelCopyWithImpl<ProfileModel>(
          this as ProfileModel, _$identity);

  /// Serializes this ProfileModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pseudo, pseudo) || other.pseudo == pseudo) &&
            (identical(other.sex, sex) || other.sex == sex) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.city, city) || other.city == city) &&
            const DeepCollectionEquality().equals(other.interests, interests) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.imgURL, imgURL) || other.imgURL == imgURL) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      pseudo,
      sex,
      age,
      country,
      city,
      const DeepCollectionEquality().hash(interests),
      createdDate,
      imgURL,
      description);

  @override
  String toString() {
    return 'ProfileModel(id: $id, pseudo: $pseudo, sex: $sex, age: $age, country: $country, city: $city, interests: $interests, createdDate: $createdDate, imgURL: $imgURL, description: $description)';
  }
}

/// @nodoc
abstract mixin class $ProfileModelCopyWith<$Res> {
  factory $ProfileModelCopyWith(
          ProfileModel value, $Res Function(ProfileModel) _then) =
      _$ProfileModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String pseudo,
      String sex,
      int age,
      String country,
      String city,
      List<String> interests,
      @TimestampConverter() Timestamp createdDate,
      String imgURL,
      String description});
}

/// @nodoc
class _$ProfileModelCopyWithImpl<$Res> implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._self, this._then);

  final ProfileModel _self;
  final $Res Function(ProfileModel) _then;

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? pseudo = null,
    Object? sex = null,
    Object? age = null,
    Object? country = null,
    Object? city = null,
    Object? interests = null,
    Object? createdDate = null,
    Object? imgURL = null,
    Object? description = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      pseudo: null == pseudo
          ? _self.pseudo
          : pseudo // ignore: cast_nullable_to_non_nullable
              as String,
      sex: null == sex
          ? _self.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      country: null == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      interests: null == interests
          ? _self.interests
          : interests // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdDate: null == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      imgURL: null == imgURL
          ? _self.imgURL
          : imgURL // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ProfileModel].
extension ProfileModelPatterns on ProfileModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ProfileModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProfileModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ProfileModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ProfileModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String pseudo,
            String sex,
            int age,
            String country,
            String city,
            List<String> interests,
            @TimestampConverter() Timestamp createdDate,
            String imgURL,
            String description)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProfileModel() when $default != null:
        return $default(
            _that.id,
            _that.pseudo,
            _that.sex,
            _that.age,
            _that.country,
            _that.city,
            _that.interests,
            _that.createdDate,
            _that.imgURL,
            _that.description);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String pseudo,
            String sex,
            int age,
            String country,
            String city,
            List<String> interests,
            @TimestampConverter() Timestamp createdDate,
            String imgURL,
            String description)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileModel():
        return $default(
            _that.id,
            _that.pseudo,
            _that.sex,
            _that.age,
            _that.country,
            _that.city,
            _that.interests,
            _that.createdDate,
            _that.imgURL,
            _that.description);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String pseudo,
            String sex,
            int age,
            String country,
            String city,
            List<String> interests,
            @TimestampConverter() Timestamp createdDate,
            String imgURL,
            String description)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileModel() when $default != null:
        return $default(
            _that.id,
            _that.pseudo,
            _that.sex,
            _that.age,
            _that.country,
            _that.city,
            _that.interests,
            _that.createdDate,
            _that.imgURL,
            _that.description);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProfileModel implements ProfileModel {
  const _ProfileModel(
      {required this.id,
      required this.pseudo,
      required this.sex,
      required this.age,
      required this.country,
      required this.city,
      required final List<String> interests,
      @TimestampConverter() required this.createdDate,
      required this.imgURL,
      required this.description})
      : _interests = interests;
  factory _ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  @override
  final String id;
  @override
  final String pseudo;
  @override
  final String sex;
  @override
  final int age;
  @override
  final String country;
  @override
  final String city;
  final List<String> _interests;
  @override
  List<String> get interests {
    if (_interests is EqualUnmodifiableListView) return _interests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_interests);
  }

  @override
  @TimestampConverter()
  final Timestamp createdDate;
  @override
  final String imgURL;
  @override
  final String description;

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProfileModelCopyWith<_ProfileModel> get copyWith =>
      __$ProfileModelCopyWithImpl<_ProfileModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProfileModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfileModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pseudo, pseudo) || other.pseudo == pseudo) &&
            (identical(other.sex, sex) || other.sex == sex) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.city, city) || other.city == city) &&
            const DeepCollectionEquality()
                .equals(other._interests, _interests) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.imgURL, imgURL) || other.imgURL == imgURL) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      pseudo,
      sex,
      age,
      country,
      city,
      const DeepCollectionEquality().hash(_interests),
      createdDate,
      imgURL,
      description);

  @override
  String toString() {
    return 'ProfileModel(id: $id, pseudo: $pseudo, sex: $sex, age: $age, country: $country, city: $city, interests: $interests, createdDate: $createdDate, imgURL: $imgURL, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$ProfileModelCopyWith<$Res>
    implements $ProfileModelCopyWith<$Res> {
  factory _$ProfileModelCopyWith(
          _ProfileModel value, $Res Function(_ProfileModel) _then) =
      __$ProfileModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String pseudo,
      String sex,
      int age,
      String country,
      String city,
      List<String> interests,
      @TimestampConverter() Timestamp createdDate,
      String imgURL,
      String description});
}

/// @nodoc
class __$ProfileModelCopyWithImpl<$Res>
    implements _$ProfileModelCopyWith<$Res> {
  __$ProfileModelCopyWithImpl(this._self, this._then);

  final _ProfileModel _self;
  final $Res Function(_ProfileModel) _then;

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? pseudo = null,
    Object? sex = null,
    Object? age = null,
    Object? country = null,
    Object? city = null,
    Object? interests = null,
    Object? createdDate = null,
    Object? imgURL = null,
    Object? description = null,
  }) {
    return _then(_ProfileModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      pseudo: null == pseudo
          ? _self.pseudo
          : pseudo // ignore: cast_nullable_to_non_nullable
              as String,
      sex: null == sex
          ? _self.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      country: null == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      interests: null == interests
          ? _self._interests
          : interests // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdDate: null == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      imgURL: null == imgURL
          ? _self.imgURL
          : imgURL // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
