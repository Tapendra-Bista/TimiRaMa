// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reel_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReelModel {
  String get uid;
  String get rid;
  String get profileImage;
  String get name;
  String get reelUrl;
  String get description;

  /// Create a copy of ReelModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReelModelCopyWith<ReelModel> get copyWith =>
      _$ReelModelCopyWithImpl<ReelModel>(this as ReelModel, _$identity);

  /// Serializes this ReelModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReelModel &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.rid, rid) || other.rid == rid) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.reelUrl, reelUrl) || other.reelUrl == reelUrl) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, uid, rid, profileImage, name, reelUrl, description);

  @override
  String toString() {
    return 'ReelModel(uid: $uid, rid: $rid, profileImage: $profileImage, name: $name, reelUrl: $reelUrl, description: $description)';
  }
}

/// @nodoc
abstract mixin class $ReelModelCopyWith<$Res> {
  factory $ReelModelCopyWith(ReelModel value, $Res Function(ReelModel) _then) =
      _$ReelModelCopyWithImpl;
  @useResult
  $Res call(
      {String uid,
      String rid,
      String profileImage,
      String name,
      String reelUrl,
      String description});
}

/// @nodoc
class _$ReelModelCopyWithImpl<$Res> implements $ReelModelCopyWith<$Res> {
  _$ReelModelCopyWithImpl(this._self, this._then);

  final ReelModel _self;
  final $Res Function(ReelModel) _then;

  /// Create a copy of ReelModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? rid = null,
    Object? profileImage = null,
    Object? name = null,
    Object? reelUrl = null,
    Object? description = null,
  }) {
    return _then(_self.copyWith(
      uid: null == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      rid: null == rid
          ? _self.rid
          : rid // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _self.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      reelUrl: null == reelUrl
          ? _self.reelUrl
          : reelUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ReelModel].
extension ReelModelPatterns on ReelModel {
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
    TResult Function(_ReelModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReelModel() when $default != null:
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
    TResult Function(_ReelModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReelModel():
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
    TResult? Function(_ReelModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReelModel() when $default != null:
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
    TResult Function(String uid, String rid, String profileImage, String name,
            String reelUrl, String description)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReelModel() when $default != null:
        return $default(_that.uid, _that.rid, _that.profileImage, _that.name,
            _that.reelUrl, _that.description);
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
    TResult Function(String uid, String rid, String profileImage, String name,
            String reelUrl, String description)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReelModel():
        return $default(_that.uid, _that.rid, _that.profileImage, _that.name,
            _that.reelUrl, _that.description);
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
    TResult? Function(String uid, String rid, String profileImage, String name,
            String reelUrl, String description)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReelModel() when $default != null:
        return $default(_that.uid, _that.rid, _that.profileImage, _that.name,
            _that.reelUrl, _that.description);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ReelModel implements ReelModel {
  const _ReelModel(
      {required this.uid,
      required this.rid,
      required this.profileImage,
      required this.name,
      required this.reelUrl,
      required this.description});
  factory _ReelModel.fromJson(Map<String, dynamic> json) =>
      _$ReelModelFromJson(json);

  @override
  final String uid;
  @override
  final String rid;
  @override
  final String profileImage;
  @override
  final String name;
  @override
  final String reelUrl;
  @override
  final String description;

  /// Create a copy of ReelModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReelModelCopyWith<_ReelModel> get copyWith =>
      __$ReelModelCopyWithImpl<_ReelModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReelModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReelModel &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.rid, rid) || other.rid == rid) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.reelUrl, reelUrl) || other.reelUrl == reelUrl) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, uid, rid, profileImage, name, reelUrl, description);

  @override
  String toString() {
    return 'ReelModel(uid: $uid, rid: $rid, profileImage: $profileImage, name: $name, reelUrl: $reelUrl, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$ReelModelCopyWith<$Res>
    implements $ReelModelCopyWith<$Res> {
  factory _$ReelModelCopyWith(
          _ReelModel value, $Res Function(_ReelModel) _then) =
      __$ReelModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String uid,
      String rid,
      String profileImage,
      String name,
      String reelUrl,
      String description});
}

/// @nodoc
class __$ReelModelCopyWithImpl<$Res> implements _$ReelModelCopyWith<$Res> {
  __$ReelModelCopyWithImpl(this._self, this._then);

  final _ReelModel _self;
  final $Res Function(_ReelModel) _then;

  /// Create a copy of ReelModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? uid = null,
    Object? rid = null,
    Object? profileImage = null,
    Object? name = null,
    Object? reelUrl = null,
    Object? description = null,
  }) {
    return _then(_ReelModel(
      uid: null == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      rid: null == rid
          ? _self.rid
          : rid // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _self.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      reelUrl: null == reelUrl
          ? _self.reelUrl
          : reelUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
