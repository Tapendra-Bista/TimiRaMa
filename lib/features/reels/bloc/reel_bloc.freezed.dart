// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reel_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReelEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ReelEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ReelEvent()';
  }
}

/// @nodoc
class $ReelEventCopyWith<$Res> {
  $ReelEventCopyWith(ReelEvent _, $Res Function(ReelEvent) __);
}

/// Adds pattern-matching-related methods to [ReelEvent].
extension ReelEventPatterns on ReelEvent {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReelLoaded value)? reelLoaded,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ReelLoaded() when reelLoaded != null:
        return reelLoaded(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(ReelLoaded value) reelLoaded,
  }) {
    final _that = this;
    switch (_that) {
      case ReelLoaded():
        return reelLoaded(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReelLoaded value)? reelLoaded,
  }) {
    final _that = this;
    switch (_that) {
      case ReelLoaded() when reelLoaded != null:
        return reelLoaded(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reelLoaded,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ReelLoaded() when reelLoaded != null:
        return reelLoaded();
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
  TResult when<TResult extends Object?>({
    required TResult Function() reelLoaded,
  }) {
    final _that = this;
    switch (_that) {
      case ReelLoaded():
        return reelLoaded();
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reelLoaded,
  }) {
    final _that = this;
    switch (_that) {
      case ReelLoaded() when reelLoaded != null:
        return reelLoaded();
      case _:
        return null;
    }
  }
}

/// @nodoc

class ReelLoaded implements ReelEvent {
  const ReelLoaded();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ReelLoaded);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ReelEvent.reelLoaded()';
  }
}

ReelState _$ReelStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'initial':
      return Initial.fromJson(json);
    case 'reelError':
      return ReelError.fromJson(json);
    case 'reelEmpty':
      return ReelEmpty.fromJson(json);
    case 'loading':
      return Loading.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ReelState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ReelState {
  /// Serializes this ReelState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ReelState);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ReelState()';
  }
}

/// @nodoc
class $ReelStateCopyWith<$Res> {
  $ReelStateCopyWith(ReelState _, $Res Function(ReelState) __);
}

/// Adds pattern-matching-related methods to [ReelState].
extension ReelStatePatterns on ReelState {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(ReelError value)? reelError,
    TResult Function(ReelEmpty value)? reelEmpty,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case Initial() when initial != null:
        return initial(_that);
      case ReelError() when reelError != null:
        return reelError(_that);
      case ReelEmpty() when reelEmpty != null:
        return reelEmpty(_that);
      case Loading() when loading != null:
        return loading(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(ReelError value) reelError,
    required TResult Function(ReelEmpty value) reelEmpty,
    required TResult Function(Loading value) loading,
  }) {
    final _that = this;
    switch (_that) {
      case Initial():
        return initial(_that);
      case ReelError():
        return reelError(_that);
      case ReelEmpty():
        return reelEmpty(_that);
      case Loading():
        return loading(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(ReelError value)? reelError,
    TResult? Function(ReelEmpty value)? reelEmpty,
    TResult? Function(Loading value)? loading,
  }) {
    final _that = this;
    switch (_that) {
      case Initial() when initial != null:
        return initial(_that);
      case ReelError() when reelError != null:
        return reelError(_that);
      case ReelEmpty() when reelEmpty != null:
        return reelEmpty(_that);
      case Loading() when loading != null:
        return loading(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ReelModel> reelModel)? initial,
    TResult Function(String errorMessage)? reelError,
    TResult Function()? reelEmpty,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case Initial() when initial != null:
        return initial(_that.reelModel);
      case ReelError() when reelError != null:
        return reelError(_that.errorMessage);
      case ReelEmpty() when reelEmpty != null:
        return reelEmpty();
      case Loading() when loading != null:
        return loading();
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
  TResult when<TResult extends Object?>({
    required TResult Function(List<ReelModel> reelModel) initial,
    required TResult Function(String errorMessage) reelError,
    required TResult Function() reelEmpty,
    required TResult Function() loading,
  }) {
    final _that = this;
    switch (_that) {
      case Initial():
        return initial(_that.reelModel);
      case ReelError():
        return reelError(_that.errorMessage);
      case ReelEmpty():
        return reelEmpty();
      case Loading():
        return loading();
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ReelModel> reelModel)? initial,
    TResult? Function(String errorMessage)? reelError,
    TResult? Function()? reelEmpty,
    TResult? Function()? loading,
  }) {
    final _that = this;
    switch (_that) {
      case Initial() when initial != null:
        return initial(_that.reelModel);
      case ReelError() when reelError != null:
        return reelError(_that.errorMessage);
      case ReelEmpty() when reelEmpty != null:
        return reelEmpty();
      case Loading() when loading != null:
        return loading();
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class Initial implements ReelState {
  const Initial(
      {final List<ReelModel> reelModel = const [], final String? $type})
      : _reelModel = reelModel,
        $type = $type ?? 'initial';
  factory Initial.fromJson(Map<String, dynamic> json) =>
      _$InitialFromJson(json);

  final List<ReelModel> _reelModel;
  @JsonKey()
  List<ReelModel> get reelModel {
    if (_reelModel is EqualUnmodifiableListView) return _reelModel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reelModel);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of ReelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InitialCopyWith<Initial> get copyWith =>
      _$InitialCopyWithImpl<Initial>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InitialToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Initial &&
            const DeepCollectionEquality()
                .equals(other._reelModel, _reelModel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_reelModel));

  @override
  String toString() {
    return 'ReelState.initial(reelModel: $reelModel)';
  }
}

/// @nodoc
abstract mixin class $InitialCopyWith<$Res>
    implements $ReelStateCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) _then) =
      _$InitialCopyWithImpl;
  @useResult
  $Res call({List<ReelModel> reelModel});
}

/// @nodoc
class _$InitialCopyWithImpl<$Res> implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(this._self, this._then);

  final Initial _self;
  final $Res Function(Initial) _then;

  /// Create a copy of ReelState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? reelModel = null,
  }) {
    return _then(Initial(
      reelModel: null == reelModel
          ? _self._reelModel
          : reelModel // ignore: cast_nullable_to_non_nullable
              as List<ReelModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class ReelError implements ReelState {
  const ReelError({required this.errorMessage, final String? $type})
      : $type = $type ?? 'reelError';
  factory ReelError.fromJson(Map<String, dynamic> json) =>
      _$ReelErrorFromJson(json);

  final String errorMessage;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of ReelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReelErrorCopyWith<ReelError> get copyWith =>
      _$ReelErrorCopyWithImpl<ReelError>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReelErrorToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReelError &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @override
  String toString() {
    return 'ReelState.reelError(errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $ReelErrorCopyWith<$Res>
    implements $ReelStateCopyWith<$Res> {
  factory $ReelErrorCopyWith(ReelError value, $Res Function(ReelError) _then) =
      _$ReelErrorCopyWithImpl;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class _$ReelErrorCopyWithImpl<$Res> implements $ReelErrorCopyWith<$Res> {
  _$ReelErrorCopyWithImpl(this._self, this._then);

  final ReelError _self;
  final $Res Function(ReelError) _then;

  /// Create a copy of ReelState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(ReelError(
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class ReelEmpty implements ReelState {
  const ReelEmpty({final String? $type}) : $type = $type ?? 'reelEmpty';
  factory ReelEmpty.fromJson(Map<String, dynamic> json) =>
      _$ReelEmptyFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$ReelEmptyToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ReelEmpty);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ReelState.reelEmpty()';
  }
}

/// @nodoc
@JsonSerializable()
class Loading implements ReelState {
  const Loading({final String? $type}) : $type = $type ?? 'loading';
  factory Loading.fromJson(Map<String, dynamic> json) =>
      _$LoadingFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$LoadingToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Loading);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ReelState.loading()';
  }
}

// dart format on
