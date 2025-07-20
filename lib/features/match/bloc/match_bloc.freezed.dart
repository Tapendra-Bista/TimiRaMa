// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MatchEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MatchEvent()';
  }
}

/// @nodoc
class $MatchEventCopyWith<$Res> {
  $MatchEventCopyWith(MatchEvent _, $Res Function(MatchEvent) __);
}

/// Adds pattern-matching-related methods to [MatchEvent].
extension MatchEventPatterns on MatchEvent {
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
    TResult Function(_Started value)? started,
    TResult Function(HandleRightSwipe value)? handleRightSwipe,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case HandleRightSwipe() when handleRightSwipe != null:
        return handleRightSwipe(_that);
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
    required TResult Function(_Started value) started,
    required TResult Function(HandleRightSwipe value) handleRightSwipe,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started(_that);
      case HandleRightSwipe():
        return handleRightSwipe(_that);
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
    TResult? Function(_Started value)? started,
    TResult? Function(HandleRightSwipe value)? handleRightSwipe,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case HandleRightSwipe() when handleRightSwipe != null:
        return handleRightSwipe(_that);
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
    TResult Function()? started,
    TResult Function(String swipedUserId, String matchedUserId,
            String matchedUserName, String matchedUserImage)?
        handleRightSwipe,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started();
      case HandleRightSwipe() when handleRightSwipe != null:
        return handleRightSwipe(_that.swipedUserId, _that.matchedUserId,
            _that.matchedUserName, _that.matchedUserImage);
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
    required TResult Function() started,
    required TResult Function(String swipedUserId, String matchedUserId,
            String matchedUserName, String matchedUserImage)
        handleRightSwipe,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started();
      case HandleRightSwipe():
        return handleRightSwipe(_that.swipedUserId, _that.matchedUserId,
            _that.matchedUserName, _that.matchedUserImage);
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
    TResult? Function()? started,
    TResult? Function(String swipedUserId, String matchedUserId,
            String matchedUserName, String matchedUserImage)?
        handleRightSwipe,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started();
      case HandleRightSwipe() when handleRightSwipe != null:
        return handleRightSwipe(_that.swipedUserId, _that.matchedUserId,
            _that.matchedUserName, _that.matchedUserImage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Started implements MatchEvent {
  const _Started();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MatchEvent.started()';
  }
}

/// @nodoc

class HandleRightSwipe implements MatchEvent {
  const HandleRightSwipe(
      {required this.swipedUserId,
      required this.matchedUserId,
      required this.matchedUserName,
      required this.matchedUserImage});

  final String swipedUserId;
  final String matchedUserId;
  final String matchedUserName;
  final String matchedUserImage;

  /// Create a copy of MatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HandleRightSwipeCopyWith<HandleRightSwipe> get copyWith =>
      _$HandleRightSwipeCopyWithImpl<HandleRightSwipe>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HandleRightSwipe &&
            (identical(other.swipedUserId, swipedUserId) ||
                other.swipedUserId == swipedUserId) &&
            (identical(other.matchedUserId, matchedUserId) ||
                other.matchedUserId == matchedUserId) &&
            (identical(other.matchedUserName, matchedUserName) ||
                other.matchedUserName == matchedUserName) &&
            (identical(other.matchedUserImage, matchedUserImage) ||
                other.matchedUserImage == matchedUserImage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, swipedUserId, matchedUserId,
      matchedUserName, matchedUserImage);

  @override
  String toString() {
    return 'MatchEvent.handleRightSwipe(swipedUserId: $swipedUserId, matchedUserId: $matchedUserId, matchedUserName: $matchedUserName, matchedUserImage: $matchedUserImage)';
  }
}

/// @nodoc
abstract mixin class $HandleRightSwipeCopyWith<$Res>
    implements $MatchEventCopyWith<$Res> {
  factory $HandleRightSwipeCopyWith(
          HandleRightSwipe value, $Res Function(HandleRightSwipe) _then) =
      _$HandleRightSwipeCopyWithImpl;
  @useResult
  $Res call(
      {String swipedUserId,
      String matchedUserId,
      String matchedUserName,
      String matchedUserImage});
}

/// @nodoc
class _$HandleRightSwipeCopyWithImpl<$Res>
    implements $HandleRightSwipeCopyWith<$Res> {
  _$HandleRightSwipeCopyWithImpl(this._self, this._then);

  final HandleRightSwipe _self;
  final $Res Function(HandleRightSwipe) _then;

  /// Create a copy of MatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? swipedUserId = null,
    Object? matchedUserId = null,
    Object? matchedUserName = null,
    Object? matchedUserImage = null,
  }) {
    return _then(HandleRightSwipe(
      swipedUserId: null == swipedUserId
          ? _self.swipedUserId
          : swipedUserId // ignore: cast_nullable_to_non_nullable
              as String,
      matchedUserId: null == matchedUserId
          ? _self.matchedUserId
          : matchedUserId // ignore: cast_nullable_to_non_nullable
              as String,
      matchedUserName: null == matchedUserName
          ? _self.matchedUserName
          : matchedUserName // ignore: cast_nullable_to_non_nullable
              as String,
      matchedUserImage: null == matchedUserImage
          ? _self.matchedUserImage
          : matchedUserImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$MatchState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MatchState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MatchState()';
  }
}

/// @nodoc
class $MatchStateCopyWith<$Res> {
  $MatchStateCopyWith(MatchState _, $Res Function(MatchState) __);
}

/// Adds pattern-matching-related methods to [MatchState].
extension MatchStatePatterns on MatchState {
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
    TResult Function(_Initial value)? initial,
    TResult Function(Success value)? success,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case Success() when success != null:
        return success(_that);
      case Failure() when failure != null:
        return failure(_that);
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
    required TResult Function(_Initial value) initial,
    required TResult Function(Success value) success,
    required TResult Function(Failure value) failure,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case Success():
        return success(_that);
      case Failure():
        return failure(_that);
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
    TResult? Function(_Initial value)? initial,
    TResult? Function(Success value)? success,
    TResult? Function(Failure value)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case Success() when success != null:
        return success(_that);
      case Failure() when failure != null:
        return failure(_that);
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
    TResult Function()? initial,
    TResult Function(bool isMutualMatch, String matchedUserId,
            String matchedUserName, String matchedUserImage)?
        success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case Success() when success != null:
        return success(_that.isMutualMatch, _that.matchedUserId,
            _that.matchedUserName, _that.matchedUserImage);
      case Failure() when failure != null:
        return failure(_that.error);
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
    required TResult Function() initial,
    required TResult Function(bool isMutualMatch, String matchedUserId,
            String matchedUserName, String matchedUserImage)
        success,
    required TResult Function(String error) failure,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case Success():
        return success(_that.isMutualMatch, _that.matchedUserId,
            _that.matchedUserName, _that.matchedUserImage);
      case Failure():
        return failure(_that.error);
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
    TResult? Function()? initial,
    TResult? Function(bool isMutualMatch, String matchedUserId,
            String matchedUserName, String matchedUserImage)?
        success,
    TResult? Function(String error)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case Success() when success != null:
        return success(_that.isMutualMatch, _that.matchedUserId,
            _that.matchedUserName, _that.matchedUserImage);
      case Failure() when failure != null:
        return failure(_that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements MatchState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MatchState.initial()';
  }
}

/// @nodoc

class Success implements MatchState {
  const Success(
      {required this.isMutualMatch,
      required this.matchedUserId,
      required this.matchedUserName,
      required this.matchedUserImage});

  final bool isMutualMatch;
  final String matchedUserId;
  final String matchedUserName;
  final String matchedUserImage;

  /// Create a copy of MatchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SuccessCopyWith<Success> get copyWith =>
      _$SuccessCopyWithImpl<Success>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Success &&
            (identical(other.isMutualMatch, isMutualMatch) ||
                other.isMutualMatch == isMutualMatch) &&
            (identical(other.matchedUserId, matchedUserId) ||
                other.matchedUserId == matchedUserId) &&
            (identical(other.matchedUserName, matchedUserName) ||
                other.matchedUserName == matchedUserName) &&
            (identical(other.matchedUserImage, matchedUserImage) ||
                other.matchedUserImage == matchedUserImage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isMutualMatch, matchedUserId,
      matchedUserName, matchedUserImage);

  @override
  String toString() {
    return 'MatchState.success(isMutualMatch: $isMutualMatch, matchedUserId: $matchedUserId, matchedUserName: $matchedUserName, matchedUserImage: $matchedUserImage)';
  }
}

/// @nodoc
abstract mixin class $SuccessCopyWith<$Res>
    implements $MatchStateCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) _then) =
      _$SuccessCopyWithImpl;
  @useResult
  $Res call(
      {bool isMutualMatch,
      String matchedUserId,
      String matchedUserName,
      String matchedUserImage});
}

/// @nodoc
class _$SuccessCopyWithImpl<$Res> implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success _self;
  final $Res Function(Success) _then;

  /// Create a copy of MatchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isMutualMatch = null,
    Object? matchedUserId = null,
    Object? matchedUserName = null,
    Object? matchedUserImage = null,
  }) {
    return _then(Success(
      isMutualMatch: null == isMutualMatch
          ? _self.isMutualMatch
          : isMutualMatch // ignore: cast_nullable_to_non_nullable
              as bool,
      matchedUserId: null == matchedUserId
          ? _self.matchedUserId
          : matchedUserId // ignore: cast_nullable_to_non_nullable
              as String,
      matchedUserName: null == matchedUserName
          ? _self.matchedUserName
          : matchedUserName // ignore: cast_nullable_to_non_nullable
              as String,
      matchedUserImage: null == matchedUserImage
          ? _self.matchedUserImage
          : matchedUserImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class Failure implements MatchState {
  const Failure({required this.error});

  final String error;

  /// Create a copy of MatchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FailureCopyWith<Failure> get copyWith =>
      _$FailureCopyWithImpl<Failure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Failure &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'MatchState.failure(error: $error)';
  }
}

/// @nodoc
abstract mixin class $FailureCopyWith<$Res>
    implements $MatchStateCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) _then) =
      _$FailureCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res> implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure _self;
  final $Res Function(Failure) _then;

  /// Create a copy of MatchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(Failure(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
