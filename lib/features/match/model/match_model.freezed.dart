// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchModel {
  String get id;
  @TimestampConverter()
  DateTime get matchedAt;

  /// Create a copy of MatchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MatchModelCopyWith<MatchModel> get copyWith =>
      _$MatchModelCopyWithImpl<MatchModel>(this as MatchModel, _$identity);

  /// Serializes this MatchModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.matchedAt, matchedAt) ||
                other.matchedAt == matchedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, matchedAt);

  @override
  String toString() {
    return 'MatchModel(id: $id, matchedAt: $matchedAt)';
  }
}

/// @nodoc
abstract mixin class $MatchModelCopyWith<$Res> {
  factory $MatchModelCopyWith(
          MatchModel value, $Res Function(MatchModel) _then) =
      _$MatchModelCopyWithImpl;
  @useResult
  $Res call({String id, @TimestampConverter() DateTime matchedAt});
}

/// @nodoc
class _$MatchModelCopyWithImpl<$Res> implements $MatchModelCopyWith<$Res> {
  _$MatchModelCopyWithImpl(this._self, this._then);

  final MatchModel _self;
  final $Res Function(MatchModel) _then;

  /// Create a copy of MatchModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? matchedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      matchedAt: null == matchedAt
          ? _self.matchedAt
          : matchedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [MatchModel].
extension MatchModelPatterns on MatchModel {
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
    TResult Function(_MatchModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MatchModel() when $default != null:
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
    TResult Function(_MatchModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MatchModel():
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
    TResult? Function(_MatchModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MatchModel() when $default != null:
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
    TResult Function(String id, @TimestampConverter() DateTime matchedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MatchModel() when $default != null:
        return $default(_that.id, _that.matchedAt);
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
    TResult Function(String id, @TimestampConverter() DateTime matchedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MatchModel():
        return $default(_that.id, _that.matchedAt);
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
    TResult? Function(String id, @TimestampConverter() DateTime matchedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MatchModel() when $default != null:
        return $default(_that.id, _that.matchedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MatchModel implements MatchModel {
  const _MatchModel(
      {required this.id, @TimestampConverter() required this.matchedAt});
  factory _MatchModel.fromJson(Map<String, dynamic> json) =>
      _$MatchModelFromJson(json);

  @override
  final String id;
  @override
  @TimestampConverter()
  final DateTime matchedAt;

  /// Create a copy of MatchModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MatchModelCopyWith<_MatchModel> get copyWith =>
      __$MatchModelCopyWithImpl<_MatchModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MatchModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MatchModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.matchedAt, matchedAt) ||
                other.matchedAt == matchedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, matchedAt);

  @override
  String toString() {
    return 'MatchModel(id: $id, matchedAt: $matchedAt)';
  }
}

/// @nodoc
abstract mixin class _$MatchModelCopyWith<$Res>
    implements $MatchModelCopyWith<$Res> {
  factory _$MatchModelCopyWith(
          _MatchModel value, $Res Function(_MatchModel) _then) =
      __$MatchModelCopyWithImpl;
  @override
  @useResult
  $Res call({String id, @TimestampConverter() DateTime matchedAt});
}

/// @nodoc
class __$MatchModelCopyWithImpl<$Res> implements _$MatchModelCopyWith<$Res> {
  __$MatchModelCopyWithImpl(this._self, this._then);

  final _MatchModel _self;
  final $Res Function(_MatchModel) _then;

  /// Create a copy of MatchModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? matchedAt = null,
  }) {
    return _then(_MatchModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      matchedAt: null == matchedAt
          ? _self.matchedAt
          : matchedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
