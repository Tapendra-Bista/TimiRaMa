// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'archive_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ArchiveModel {
  String get id;
  List<String> get archiveId;

  /// Create a copy of ArchiveModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ArchiveModelCopyWith<ArchiveModel> get copyWith =>
      _$ArchiveModelCopyWithImpl<ArchiveModel>(
          this as ArchiveModel, _$identity);

  /// Serializes this ArchiveModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ArchiveModel &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.archiveId, archiveId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(archiveId));

  @override
  String toString() {
    return 'ArchiveModel(id: $id, archiveId: $archiveId)';
  }
}

/// @nodoc
abstract mixin class $ArchiveModelCopyWith<$Res> {
  factory $ArchiveModelCopyWith(
          ArchiveModel value, $Res Function(ArchiveModel) _then) =
      _$ArchiveModelCopyWithImpl;
  @useResult
  $Res call({String id, List<String> archiveId});
}

/// @nodoc
class _$ArchiveModelCopyWithImpl<$Res> implements $ArchiveModelCopyWith<$Res> {
  _$ArchiveModelCopyWithImpl(this._self, this._then);

  final ArchiveModel _self;
  final $Res Function(ArchiveModel) _then;

  /// Create a copy of ArchiveModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? archiveId = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      archiveId: null == archiveId
          ? _self.archiveId
          : archiveId // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// Adds pattern-matching-related methods to [ArchiveModel].
extension ArchiveModelPatterns on ArchiveModel {
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
    TResult Function(_ArchiveModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ArchiveModel() when $default != null:
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
    TResult Function(_ArchiveModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ArchiveModel():
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
    TResult? Function(_ArchiveModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ArchiveModel() when $default != null:
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
    TResult Function(String id, List<String> archiveId)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ArchiveModel() when $default != null:
        return $default(_that.id, _that.archiveId);
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
    TResult Function(String id, List<String> archiveId) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ArchiveModel():
        return $default(_that.id, _that.archiveId);
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
    TResult? Function(String id, List<String> archiveId)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ArchiveModel() when $default != null:
        return $default(_that.id, _that.archiveId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ArchiveModel implements ArchiveModel {
  const _ArchiveModel({required this.id, required final List<String> archiveId})
      : _archiveId = archiveId;
  factory _ArchiveModel.fromJson(Map<String, dynamic> json) =>
      _$ArchiveModelFromJson(json);

  @override
  final String id;
  final List<String> _archiveId;
  @override
  List<String> get archiveId {
    if (_archiveId is EqualUnmodifiableListView) return _archiveId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_archiveId);
  }

  /// Create a copy of ArchiveModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ArchiveModelCopyWith<_ArchiveModel> get copyWith =>
      __$ArchiveModelCopyWithImpl<_ArchiveModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ArchiveModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ArchiveModel &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._archiveId, _archiveId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_archiveId));

  @override
  String toString() {
    return 'ArchiveModel(id: $id, archiveId: $archiveId)';
  }
}

/// @nodoc
abstract mixin class _$ArchiveModelCopyWith<$Res>
    implements $ArchiveModelCopyWith<$Res> {
  factory _$ArchiveModelCopyWith(
          _ArchiveModel value, $Res Function(_ArchiveModel) _then) =
      __$ArchiveModelCopyWithImpl;
  @override
  @useResult
  $Res call({String id, List<String> archiveId});
}

/// @nodoc
class __$ArchiveModelCopyWithImpl<$Res>
    implements _$ArchiveModelCopyWith<$Res> {
  __$ArchiveModelCopyWithImpl(this._self, this._then);

  final _ArchiveModel _self;
  final $Res Function(_ArchiveModel) _then;

  /// Create a copy of ArchiveModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? archiveId = null,
  }) {
    return _then(_ArchiveModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      archiveId: null == archiveId
          ? _self._archiveId
          : archiveId // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
