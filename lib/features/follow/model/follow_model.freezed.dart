// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follow_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FollowModel {
  String get id;
  List<String> get followId;

  /// Create a copy of FollowModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowModelCopyWith<FollowModel> get copyWith =>
      _$FollowModelCopyWithImpl<FollowModel>(this as FollowModel, _$identity);

  /// Serializes this FollowModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowModel &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.followId, followId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(followId));

  @override
  String toString() {
    return 'FollowModel(id: $id, followId: $followId)';
  }
}

/// @nodoc
abstract mixin class $FollowModelCopyWith<$Res> {
  factory $FollowModelCopyWith(
          FollowModel value, $Res Function(FollowModel) _then) =
      _$FollowModelCopyWithImpl;
  @useResult
  $Res call({String id, List<String> followId});
}

/// @nodoc
class _$FollowModelCopyWithImpl<$Res> implements $FollowModelCopyWith<$Res> {
  _$FollowModelCopyWithImpl(this._self, this._then);

  final FollowModel _self;
  final $Res Function(FollowModel) _then;

  /// Create a copy of FollowModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? followId = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      followId: null == followId
          ? _self.followId
          : followId // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// Adds pattern-matching-related methods to [FollowModel].
extension FollowModelPatterns on FollowModel {
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
    TResult Function(_FollowModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowModel() when $default != null:
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
    TResult Function(_FollowModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowModel():
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
    TResult? Function(_FollowModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowModel() when $default != null:
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
    TResult Function(String id, List<String> followId)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowModel() when $default != null:
        return $default(_that.id, _that.followId);
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
    TResult Function(String id, List<String> followId) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowModel():
        return $default(_that.id, _that.followId);
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
    TResult? Function(String id, List<String> followId)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowModel() when $default != null:
        return $default(_that.id, _that.followId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FollowModel implements FollowModel {
  const _FollowModel({required this.id, required final List<String> followId})
      : _followId = followId;
  factory _FollowModel.fromJson(Map<String, dynamic> json) =>
      _$FollowModelFromJson(json);

  @override
  final String id;
  final List<String> _followId;
  @override
  List<String> get followId {
    if (_followId is EqualUnmodifiableListView) return _followId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_followId);
  }

  /// Create a copy of FollowModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FollowModelCopyWith<_FollowModel> get copyWith =>
      __$FollowModelCopyWithImpl<_FollowModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FollowModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowModel &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._followId, _followId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_followId));

  @override
  String toString() {
    return 'FollowModel(id: $id, followId: $followId)';
  }
}

/// @nodoc
abstract mixin class _$FollowModelCopyWith<$Res>
    implements $FollowModelCopyWith<$Res> {
  factory _$FollowModelCopyWith(
          _FollowModel value, $Res Function(_FollowModel) _then) =
      __$FollowModelCopyWithImpl;
  @override
  @useResult
  $Res call({String id, List<String> followId});
}

/// @nodoc
class __$FollowModelCopyWithImpl<$Res> implements _$FollowModelCopyWith<$Res> {
  __$FollowModelCopyWithImpl(this._self, this._then);

  final _FollowModel _self;
  final $Res Function(_FollowModel) _then;

  /// Create a copy of FollowModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? followId = null,
  }) {
    return _then(_FollowModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      followId: null == followId
          ? _self._followId
          : followId // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
