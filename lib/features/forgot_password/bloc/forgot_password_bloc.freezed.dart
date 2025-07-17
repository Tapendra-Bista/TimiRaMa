// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ForgotPasswordEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ForgotPasswordEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ForgotPasswordEvent()';
  }
}

/// @nodoc
class $ForgotPasswordEventCopyWith<$Res> {
  $ForgotPasswordEventCopyWith(
      ForgotPasswordEvent _, $Res Function(ForgotPasswordEvent) __);
}

/// Adds pattern-matching-related methods to [ForgotPasswordEvent].
extension ForgotPasswordEventPatterns on ForgotPasswordEvent {
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
    TResult Function(UserEmail value)? userEmail,
    TResult Function(SendButtonClicked value)? sendButtonClicked,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case UserEmail() when userEmail != null:
        return userEmail(_that);
      case SendButtonClicked() when sendButtonClicked != null:
        return sendButtonClicked(_that);
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
    required TResult Function(UserEmail value) userEmail,
    required TResult Function(SendButtonClicked value) sendButtonClicked,
  }) {
    final _that = this;
    switch (_that) {
      case UserEmail():
        return userEmail(_that);
      case SendButtonClicked():
        return sendButtonClicked(_that);
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
    TResult? Function(UserEmail value)? userEmail,
    TResult? Function(SendButtonClicked value)? sendButtonClicked,
  }) {
    final _that = this;
    switch (_that) {
      case UserEmail() when userEmail != null:
        return userEmail(_that);
      case SendButtonClicked() when sendButtonClicked != null:
        return sendButtonClicked(_that);
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
    TResult Function(String userEmail)? userEmail,
    TResult Function()? sendButtonClicked,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case UserEmail() when userEmail != null:
        return userEmail(_that.userEmail);
      case SendButtonClicked() when sendButtonClicked != null:
        return sendButtonClicked();
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
    required TResult Function(String userEmail) userEmail,
    required TResult Function() sendButtonClicked,
  }) {
    final _that = this;
    switch (_that) {
      case UserEmail():
        return userEmail(_that.userEmail);
      case SendButtonClicked():
        return sendButtonClicked();
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
    TResult? Function(String userEmail)? userEmail,
    TResult? Function()? sendButtonClicked,
  }) {
    final _that = this;
    switch (_that) {
      case UserEmail() when userEmail != null:
        return userEmail(_that.userEmail);
      case SendButtonClicked() when sendButtonClicked != null:
        return sendButtonClicked();
      case _:
        return null;
    }
  }
}

/// @nodoc

class UserEmail implements ForgotPasswordEvent {
  const UserEmail({required this.userEmail});

  final String userEmail;

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserEmailCopyWith<UserEmail> get copyWith =>
      _$UserEmailCopyWithImpl<UserEmail>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserEmail &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userEmail);

  @override
  String toString() {
    return 'ForgotPasswordEvent.userEmail(userEmail: $userEmail)';
  }
}

/// @nodoc
abstract mixin class $UserEmailCopyWith<$Res>
    implements $ForgotPasswordEventCopyWith<$Res> {
  factory $UserEmailCopyWith(UserEmail value, $Res Function(UserEmail) _then) =
      _$UserEmailCopyWithImpl;
  @useResult
  $Res call({String userEmail});
}

/// @nodoc
class _$UserEmailCopyWithImpl<$Res> implements $UserEmailCopyWith<$Res> {
  _$UserEmailCopyWithImpl(this._self, this._then);

  final UserEmail _self;
  final $Res Function(UserEmail) _then;

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userEmail = null,
  }) {
    return _then(UserEmail(
      userEmail: null == userEmail
          ? _self.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class SendButtonClicked implements ForgotPasswordEvent {
  const SendButtonClicked();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SendButtonClicked);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ForgotPasswordEvent.sendButtonClicked()';
  }
}

/// @nodoc
mixin _$ForgotPasswordState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ForgotPasswordState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ForgotPasswordState()';
  }
}

/// @nodoc
class $ForgotPasswordStateCopyWith<$Res> {
  $ForgotPasswordStateCopyWith(
      ForgotPasswordState _, $Res Function(ForgotPasswordState) __);
}

/// Adds pattern-matching-related methods to [ForgotPasswordState].
extension ForgotPasswordStatePatterns on ForgotPasswordState {
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
    TResult Function(ForgotPasswordInitial value)? initial,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ForgotPasswordInitial() when initial != null:
        return initial(_that);
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
    required TResult Function(ForgotPasswordInitial value) initial,
  }) {
    final _that = this;
    switch (_that) {
      case ForgotPasswordInitial():
        return initial(_that);
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
    TResult? Function(ForgotPasswordInitial value)? initial,
  }) {
    final _that = this;
    switch (_that) {
      case ForgotPasswordInitial() when initial != null:
        return initial(_that);
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
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ForgotPasswordInitial() when initial != null:
        return initial();
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
  }) {
    final _that = this;
    switch (_that) {
      case ForgotPasswordInitial():
        return initial();
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
  }) {
    final _that = this;
    switch (_that) {
      case ForgotPasswordInitial() when initial != null:
        return initial();
      case _:
        return null;
    }
  }
}

/// @nodoc

class ForgotPasswordInitial implements ForgotPasswordState {
  const ForgotPasswordInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ForgotPasswordInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ForgotPasswordState.initial()';
  }
}

// dart format on
