// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wellcome_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WellcomeEvent {
  String get languageCode;

  /// Create a copy of WellcomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WellcomeEventCopyWith<WellcomeEvent> get copyWith =>
      _$WellcomeEventCopyWithImpl<WellcomeEvent>(
          this as WellcomeEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WellcomeEvent &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, languageCode);

  @override
  String toString() {
    return 'WellcomeEvent(languageCode: $languageCode)';
  }
}

/// @nodoc
abstract mixin class $WellcomeEventCopyWith<$Res> {
  factory $WellcomeEventCopyWith(
          WellcomeEvent value, $Res Function(WellcomeEvent) _then) =
      _$WellcomeEventCopyWithImpl;
  @useResult
  $Res call({String languageCode});
}

/// @nodoc
class _$WellcomeEventCopyWithImpl<$Res>
    implements $WellcomeEventCopyWith<$Res> {
  _$WellcomeEventCopyWithImpl(this._self, this._then);

  final WellcomeEvent _self;
  final $Res Function(WellcomeEvent) _then;

  /// Create a copy of WellcomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageCode = null,
  }) {
    return _then(_self.copyWith(
      languageCode: null == languageCode
          ? _self.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [WellcomeEvent].
extension WellcomeEventPatterns on WellcomeEvent {
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
    TResult Function(ChangeLanguage value)? changeLanguage,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ChangeLanguage() when changeLanguage != null:
        return changeLanguage(_that);
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
    required TResult Function(ChangeLanguage value) changeLanguage,
  }) {
    final _that = this;
    switch (_that) {
      case ChangeLanguage():
        return changeLanguage(_that);
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
    TResult? Function(ChangeLanguage value)? changeLanguage,
  }) {
    final _that = this;
    switch (_that) {
      case ChangeLanguage() when changeLanguage != null:
        return changeLanguage(_that);
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
    TResult Function(String languageCode)? changeLanguage,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ChangeLanguage() when changeLanguage != null:
        return changeLanguage(_that.languageCode);
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
    required TResult Function(String languageCode) changeLanguage,
  }) {
    final _that = this;
    switch (_that) {
      case ChangeLanguage():
        return changeLanguage(_that.languageCode);
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
    TResult? Function(String languageCode)? changeLanguage,
  }) {
    final _that = this;
    switch (_that) {
      case ChangeLanguage() when changeLanguage != null:
        return changeLanguage(_that.languageCode);
      case _:
        return null;
    }
  }
}

/// @nodoc

class ChangeLanguage implements WellcomeEvent {
  const ChangeLanguage({required this.languageCode});

  @override
  final String languageCode;

  /// Create a copy of WellcomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChangeLanguageCopyWith<ChangeLanguage> get copyWith =>
      _$ChangeLanguageCopyWithImpl<ChangeLanguage>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChangeLanguage &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, languageCode);

  @override
  String toString() {
    return 'WellcomeEvent.changeLanguage(languageCode: $languageCode)';
  }
}

/// @nodoc
abstract mixin class $ChangeLanguageCopyWith<$Res>
    implements $WellcomeEventCopyWith<$Res> {
  factory $ChangeLanguageCopyWith(
          ChangeLanguage value, $Res Function(ChangeLanguage) _then) =
      _$ChangeLanguageCopyWithImpl;
  @override
  @useResult
  $Res call({String languageCode});
}

/// @nodoc
class _$ChangeLanguageCopyWithImpl<$Res>
    implements $ChangeLanguageCopyWith<$Res> {
  _$ChangeLanguageCopyWithImpl(this._self, this._then);

  final ChangeLanguage _self;
  final $Res Function(ChangeLanguage) _then;

  /// Create a copy of WellcomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? languageCode = null,
  }) {
    return _then(ChangeLanguage(
      languageCode: null == languageCode
          ? _self.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$WellcomeState {
  String get languageCode;

  /// Create a copy of WellcomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WellcomeStateCopyWith<WellcomeState> get copyWith =>
      _$WellcomeStateCopyWithImpl<WellcomeState>(
          this as WellcomeState, _$identity);

  /// Serializes this WellcomeState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WellcomeState &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, languageCode);

  @override
  String toString() {
    return 'WellcomeState(languageCode: $languageCode)';
  }
}

/// @nodoc
abstract mixin class $WellcomeStateCopyWith<$Res> {
  factory $WellcomeStateCopyWith(
          WellcomeState value, $Res Function(WellcomeState) _then) =
      _$WellcomeStateCopyWithImpl;
  @useResult
  $Res call({String languageCode});
}

/// @nodoc
class _$WellcomeStateCopyWithImpl<$Res>
    implements $WellcomeStateCopyWith<$Res> {
  _$WellcomeStateCopyWithImpl(this._self, this._then);

  final WellcomeState _self;
  final $Res Function(WellcomeState) _then;

  /// Create a copy of WellcomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageCode = null,
  }) {
    return _then(_self.copyWith(
      languageCode: null == languageCode
          ? _self.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [WellcomeState].
extension WellcomeStatePatterns on WellcomeState {
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
    TResult Function(_WellcomeState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WellcomeState() when $default != null:
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
    TResult Function(_WellcomeState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WellcomeState():
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
    TResult? Function(_WellcomeState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WellcomeState() when $default != null:
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
    TResult Function(String languageCode)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WellcomeState() when $default != null:
        return $default(_that.languageCode);
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
    TResult Function(String languageCode) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WellcomeState():
        return $default(_that.languageCode);
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
    TResult? Function(String languageCode)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WellcomeState() when $default != null:
        return $default(_that.languageCode);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _WellcomeState implements WellcomeState {
  const _WellcomeState({this.languageCode = 'fr'});
  factory _WellcomeState.fromJson(Map<String, dynamic> json) =>
      _$WellcomeStateFromJson(json);

  @override
  @JsonKey()
  final String languageCode;

  /// Create a copy of WellcomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WellcomeStateCopyWith<_WellcomeState> get copyWith =>
      __$WellcomeStateCopyWithImpl<_WellcomeState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WellcomeStateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WellcomeState &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, languageCode);

  @override
  String toString() {
    return 'WellcomeState(languageCode: $languageCode)';
  }
}

/// @nodoc
abstract mixin class _$WellcomeStateCopyWith<$Res>
    implements $WellcomeStateCopyWith<$Res> {
  factory _$WellcomeStateCopyWith(
          _WellcomeState value, $Res Function(_WellcomeState) _then) =
      __$WellcomeStateCopyWithImpl;
  @override
  @useResult
  $Res call({String languageCode});
}

/// @nodoc
class __$WellcomeStateCopyWithImpl<$Res>
    implements _$WellcomeStateCopyWith<$Res> {
  __$WellcomeStateCopyWithImpl(this._self, this._then);

  final _WellcomeState _self;
  final $Res Function(_WellcomeState) _then;

  /// Create a copy of WellcomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? languageCode = null,
  }) {
    return _then(_WellcomeState(
      languageCode: null == languageCode
          ? _self.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
