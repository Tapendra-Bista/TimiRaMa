// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stories_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StoriesModel {
  String get uid;
  List<String> get containUrl;
  @TimestampConverter()
  List<Timestamp> get createdDate;
  dynamic get userName;
  dynamic get userImg;

  /// Create a copy of StoriesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StoriesModelCopyWith<StoriesModel> get copyWith =>
      _$StoriesModelCopyWithImpl<StoriesModel>(
          this as StoriesModel, _$identity);

  /// Serializes this StoriesModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StoriesModel &&
            (identical(other.uid, uid) || other.uid == uid) &&
            const DeepCollectionEquality()
                .equals(other.containUrl, containUrl) &&
            const DeepCollectionEquality()
                .equals(other.createdDate, createdDate) &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality().equals(other.userImg, userImg));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      const DeepCollectionEquality().hash(containUrl),
      const DeepCollectionEquality().hash(createdDate),
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(userImg));

  @override
  String toString() {
    return 'StoriesModel(uid: $uid, containUrl: $containUrl, createdDate: $createdDate, userName: $userName, userImg: $userImg)';
  }
}

/// @nodoc
abstract mixin class $StoriesModelCopyWith<$Res> {
  factory $StoriesModelCopyWith(
          StoriesModel value, $Res Function(StoriesModel) _then) =
      _$StoriesModelCopyWithImpl;
  @useResult
  $Res call(
      {String uid,
      List<String> containUrl,
      @TimestampConverter() List<Timestamp> createdDate,
      dynamic userName,
      dynamic userImg});
}

/// @nodoc
class _$StoriesModelCopyWithImpl<$Res> implements $StoriesModelCopyWith<$Res> {
  _$StoriesModelCopyWithImpl(this._self, this._then);

  final StoriesModel _self;
  final $Res Function(StoriesModel) _then;

  /// Create a copy of StoriesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? containUrl = null,
    Object? createdDate = null,
    Object? userName = freezed,
    Object? userImg = freezed,
  }) {
    return _then(_self.copyWith(
      uid: null == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      containUrl: null == containUrl
          ? _self.containUrl
          : containUrl // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdDate: null == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as List<Timestamp>,
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userImg: freezed == userImg
          ? _self.userImg
          : userImg // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// Adds pattern-matching-related methods to [StoriesModel].
extension StoriesModelPatterns on StoriesModel {
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
    TResult Function(_StoriesModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StoriesModel() when $default != null:
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
    TResult Function(_StoriesModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StoriesModel():
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
    TResult? Function(_StoriesModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StoriesModel() when $default != null:
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
            String uid,
            List<String> containUrl,
            @TimestampConverter() List<Timestamp> createdDate,
            dynamic userName,
            dynamic userImg)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StoriesModel() when $default != null:
        return $default(_that.uid, _that.containUrl, _that.createdDate,
            _that.userName, _that.userImg);
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
            String uid,
            List<String> containUrl,
            @TimestampConverter() List<Timestamp> createdDate,
            dynamic userName,
            dynamic userImg)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StoriesModel():
        return $default(_that.uid, _that.containUrl, _that.createdDate,
            _that.userName, _that.userImg);
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
            String uid,
            List<String> containUrl,
            @TimestampConverter() List<Timestamp> createdDate,
            dynamic userName,
            dynamic userImg)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StoriesModel() when $default != null:
        return $default(_that.uid, _that.containUrl, _that.createdDate,
            _that.userName, _that.userImg);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _StoriesModel implements StoriesModel {
  const _StoriesModel(
      {required this.uid,
      required final List<String> containUrl,
      @TimestampConverter() required final List<Timestamp> createdDate,
      required this.userName,
      required this.userImg})
      : _containUrl = containUrl,
        _createdDate = createdDate;
  factory _StoriesModel.fromJson(Map<String, dynamic> json) =>
      _$StoriesModelFromJson(json);

  @override
  final String uid;
  final List<String> _containUrl;
  @override
  List<String> get containUrl {
    if (_containUrl is EqualUnmodifiableListView) return _containUrl;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_containUrl);
  }

  final List<Timestamp> _createdDate;
  @override
  @TimestampConverter()
  List<Timestamp> get createdDate {
    if (_createdDate is EqualUnmodifiableListView) return _createdDate;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_createdDate);
  }

  @override
  final dynamic userName;
  @override
  final dynamic userImg;

  /// Create a copy of StoriesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StoriesModelCopyWith<_StoriesModel> get copyWith =>
      __$StoriesModelCopyWithImpl<_StoriesModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StoriesModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StoriesModel &&
            (identical(other.uid, uid) || other.uid == uid) &&
            const DeepCollectionEquality()
                .equals(other._containUrl, _containUrl) &&
            const DeepCollectionEquality()
                .equals(other._createdDate, _createdDate) &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality().equals(other.userImg, userImg));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      const DeepCollectionEquality().hash(_containUrl),
      const DeepCollectionEquality().hash(_createdDate),
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(userImg));

  @override
  String toString() {
    return 'StoriesModel(uid: $uid, containUrl: $containUrl, createdDate: $createdDate, userName: $userName, userImg: $userImg)';
  }
}

/// @nodoc
abstract mixin class _$StoriesModelCopyWith<$Res>
    implements $StoriesModelCopyWith<$Res> {
  factory _$StoriesModelCopyWith(
          _StoriesModel value, $Res Function(_StoriesModel) _then) =
      __$StoriesModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String uid,
      List<String> containUrl,
      @TimestampConverter() List<Timestamp> createdDate,
      dynamic userName,
      dynamic userImg});
}

/// @nodoc
class __$StoriesModelCopyWithImpl<$Res>
    implements _$StoriesModelCopyWith<$Res> {
  __$StoriesModelCopyWithImpl(this._self, this._then);

  final _StoriesModel _self;
  final $Res Function(_StoriesModel) _then;

  /// Create a copy of StoriesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? uid = null,
    Object? containUrl = null,
    Object? createdDate = null,
    Object? userName = freezed,
    Object? userImg = freezed,
  }) {
    return _then(_StoriesModel(
      uid: null == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      containUrl: null == containUrl
          ? _self._containUrl
          : containUrl // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdDate: null == createdDate
          ? _self._createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as List<Timestamp>,
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userImg: freezed == userImg
          ? _self.userImg
          : userImg // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
mixin _$StoriesFetchModel {
  String get id;
  List<String> get containUrl;
  @TimestampConverter()
  List<Timestamp> get createdDate;
  String get userName;
  String get userImg;

  /// Create a copy of StoriesFetchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StoriesFetchModelCopyWith<StoriesFetchModel> get copyWith =>
      _$StoriesFetchModelCopyWithImpl<StoriesFetchModel>(
          this as StoriesFetchModel, _$identity);

  /// Serializes this StoriesFetchModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StoriesFetchModel &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other.containUrl, containUrl) &&
            const DeepCollectionEquality()
                .equals(other.createdDate, createdDate) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userImg, userImg) || other.userImg == userImg));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(containUrl),
      const DeepCollectionEquality().hash(createdDate),
      userName,
      userImg);

  @override
  String toString() {
    return 'StoriesFetchModel(id: $id, containUrl: $containUrl, createdDate: $createdDate, userName: $userName, userImg: $userImg)';
  }
}

/// @nodoc
abstract mixin class $StoriesFetchModelCopyWith<$Res> {
  factory $StoriesFetchModelCopyWith(
          StoriesFetchModel value, $Res Function(StoriesFetchModel) _then) =
      _$StoriesFetchModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      List<String> containUrl,
      @TimestampConverter() List<Timestamp> createdDate,
      String userName,
      String userImg});
}

/// @nodoc
class _$StoriesFetchModelCopyWithImpl<$Res>
    implements $StoriesFetchModelCopyWith<$Res> {
  _$StoriesFetchModelCopyWithImpl(this._self, this._then);

  final StoriesFetchModel _self;
  final $Res Function(StoriesFetchModel) _then;

  /// Create a copy of StoriesFetchModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? containUrl = null,
    Object? createdDate = null,
    Object? userName = null,
    Object? userImg = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      containUrl: null == containUrl
          ? _self.containUrl
          : containUrl // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdDate: null == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as List<Timestamp>,
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userImg: null == userImg
          ? _self.userImg
          : userImg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [StoriesFetchModel].
extension StoriesFetchModelPatterns on StoriesFetchModel {
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
    TResult Function(_StoriesFetchModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StoriesFetchModel() when $default != null:
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
    TResult Function(_StoriesFetchModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StoriesFetchModel():
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
    TResult? Function(_StoriesFetchModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StoriesFetchModel() when $default != null:
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
            List<String> containUrl,
            @TimestampConverter() List<Timestamp> createdDate,
            String userName,
            String userImg)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StoriesFetchModel() when $default != null:
        return $default(_that.id, _that.containUrl, _that.createdDate,
            _that.userName, _that.userImg);
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
            List<String> containUrl,
            @TimestampConverter() List<Timestamp> createdDate,
            String userName,
            String userImg)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StoriesFetchModel():
        return $default(_that.id, _that.containUrl, _that.createdDate,
            _that.userName, _that.userImg);
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
            List<String> containUrl,
            @TimestampConverter() List<Timestamp> createdDate,
            String userName,
            String userImg)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StoriesFetchModel() when $default != null:
        return $default(_that.id, _that.containUrl, _that.createdDate,
            _that.userName, _that.userImg);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _StoriesFetchModel implements StoriesFetchModel {
  const _StoriesFetchModel(
      {required this.id,
      required final List<String> containUrl,
      @TimestampConverter() required final List<Timestamp> createdDate,
      required this.userName,
      required this.userImg})
      : _containUrl = containUrl,
        _createdDate = createdDate;
  factory _StoriesFetchModel.fromJson(Map<String, dynamic> json) =>
      _$StoriesFetchModelFromJson(json);

  @override
  final String id;
  final List<String> _containUrl;
  @override
  List<String> get containUrl {
    if (_containUrl is EqualUnmodifiableListView) return _containUrl;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_containUrl);
  }

  final List<Timestamp> _createdDate;
  @override
  @TimestampConverter()
  List<Timestamp> get createdDate {
    if (_createdDate is EqualUnmodifiableListView) return _createdDate;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_createdDate);
  }

  @override
  final String userName;
  @override
  final String userImg;

  /// Create a copy of StoriesFetchModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StoriesFetchModelCopyWith<_StoriesFetchModel> get copyWith =>
      __$StoriesFetchModelCopyWithImpl<_StoriesFetchModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StoriesFetchModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StoriesFetchModel &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._containUrl, _containUrl) &&
            const DeepCollectionEquality()
                .equals(other._createdDate, _createdDate) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userImg, userImg) || other.userImg == userImg));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_containUrl),
      const DeepCollectionEquality().hash(_createdDate),
      userName,
      userImg);

  @override
  String toString() {
    return 'StoriesFetchModel(id: $id, containUrl: $containUrl, createdDate: $createdDate, userName: $userName, userImg: $userImg)';
  }
}

/// @nodoc
abstract mixin class _$StoriesFetchModelCopyWith<$Res>
    implements $StoriesFetchModelCopyWith<$Res> {
  factory _$StoriesFetchModelCopyWith(
          _StoriesFetchModel value, $Res Function(_StoriesFetchModel) _then) =
      __$StoriesFetchModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      List<String> containUrl,
      @TimestampConverter() List<Timestamp> createdDate,
      String userName,
      String userImg});
}

/// @nodoc
class __$StoriesFetchModelCopyWithImpl<$Res>
    implements _$StoriesFetchModelCopyWith<$Res> {
  __$StoriesFetchModelCopyWithImpl(this._self, this._then);

  final _StoriesFetchModel _self;
  final $Res Function(_StoriesFetchModel) _then;

  /// Create a copy of StoriesFetchModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? containUrl = null,
    Object? createdDate = null,
    Object? userName = null,
    Object? userImg = null,
  }) {
    return _then(_StoriesFetchModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      containUrl: null == containUrl
          ? _self._containUrl
          : containUrl // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdDate: null == createdDate
          ? _self._createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as List<Timestamp>,
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userImg: null == userImg
          ? _self.userImg
          : userImg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
