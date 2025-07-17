// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReportEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ReportEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ReportEvent()';
  }
}

/// @nodoc
class $ReportEventCopyWith<$Res> {
  $ReportEventCopyWith(ReportEvent _, $Res Function(ReportEvent) __);
}

/// Adds pattern-matching-related methods to [ReportEvent].
extension ReportEventPatterns on ReportEvent {
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
    TResult Function(ViolationChoosen value)? violationChoosen,
    TResult Function(IllegalChoosen value)? illegalChoosen,
    TResult Function(AgreeCondition value)? agreeCondition,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case ViolationChoosen() when violationChoosen != null:
        return violationChoosen(_that);
      case IllegalChoosen() when illegalChoosen != null:
        return illegalChoosen(_that);
      case AgreeCondition() when agreeCondition != null:
        return agreeCondition(_that);
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
    required TResult Function(ViolationChoosen value) violationChoosen,
    required TResult Function(IllegalChoosen value) illegalChoosen,
    required TResult Function(AgreeCondition value) agreeCondition,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started(_that);
      case ViolationChoosen():
        return violationChoosen(_that);
      case IllegalChoosen():
        return illegalChoosen(_that);
      case AgreeCondition():
        return agreeCondition(_that);
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
    TResult? Function(ViolationChoosen value)? violationChoosen,
    TResult? Function(IllegalChoosen value)? illegalChoosen,
    TResult? Function(AgreeCondition value)? agreeCondition,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case ViolationChoosen() when violationChoosen != null:
        return violationChoosen(_that);
      case IllegalChoosen() when illegalChoosen != null:
        return illegalChoosen(_that);
      case AgreeCondition() when agreeCondition != null:
        return agreeCondition(_that);
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
    TResult Function(String violation)? violationChoosen,
    TResult Function(String illegal)? illegalChoosen,
    TResult Function(bool agree)? agreeCondition,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started();
      case ViolationChoosen() when violationChoosen != null:
        return violationChoosen(_that.violation);
      case IllegalChoosen() when illegalChoosen != null:
        return illegalChoosen(_that.illegal);
      case AgreeCondition() when agreeCondition != null:
        return agreeCondition(_that.agree);
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
    required TResult Function(String violation) violationChoosen,
    required TResult Function(String illegal) illegalChoosen,
    required TResult Function(bool agree) agreeCondition,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started();
      case ViolationChoosen():
        return violationChoosen(_that.violation);
      case IllegalChoosen():
        return illegalChoosen(_that.illegal);
      case AgreeCondition():
        return agreeCondition(_that.agree);
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
    TResult? Function(String violation)? violationChoosen,
    TResult? Function(String illegal)? illegalChoosen,
    TResult? Function(bool agree)? agreeCondition,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started();
      case ViolationChoosen() when violationChoosen != null:
        return violationChoosen(_that.violation);
      case IllegalChoosen() when illegalChoosen != null:
        return illegalChoosen(_that.illegal);
      case AgreeCondition() when agreeCondition != null:
        return agreeCondition(_that.agree);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Started implements ReportEvent {
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
    return 'ReportEvent.started()';
  }
}

/// @nodoc

class ViolationChoosen implements ReportEvent {
  const ViolationChoosen({required this.violation});

  final String violation;

  /// Create a copy of ReportEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ViolationChoosenCopyWith<ViolationChoosen> get copyWith =>
      _$ViolationChoosenCopyWithImpl<ViolationChoosen>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ViolationChoosen &&
            (identical(other.violation, violation) ||
                other.violation == violation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, violation);

  @override
  String toString() {
    return 'ReportEvent.violationChoosen(violation: $violation)';
  }
}

/// @nodoc
abstract mixin class $ViolationChoosenCopyWith<$Res>
    implements $ReportEventCopyWith<$Res> {
  factory $ViolationChoosenCopyWith(
          ViolationChoosen value, $Res Function(ViolationChoosen) _then) =
      _$ViolationChoosenCopyWithImpl;
  @useResult
  $Res call({String violation});
}

/// @nodoc
class _$ViolationChoosenCopyWithImpl<$Res>
    implements $ViolationChoosenCopyWith<$Res> {
  _$ViolationChoosenCopyWithImpl(this._self, this._then);

  final ViolationChoosen _self;
  final $Res Function(ViolationChoosen) _then;

  /// Create a copy of ReportEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? violation = null,
  }) {
    return _then(ViolationChoosen(
      violation: null == violation
          ? _self.violation
          : violation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class IllegalChoosen implements ReportEvent {
  const IllegalChoosen({required this.illegal});

  final String illegal;

  /// Create a copy of ReportEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IllegalChoosenCopyWith<IllegalChoosen> get copyWith =>
      _$IllegalChoosenCopyWithImpl<IllegalChoosen>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IllegalChoosen &&
            (identical(other.illegal, illegal) || other.illegal == illegal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, illegal);

  @override
  String toString() {
    return 'ReportEvent.illegalChoosen(illegal: $illegal)';
  }
}

/// @nodoc
abstract mixin class $IllegalChoosenCopyWith<$Res>
    implements $ReportEventCopyWith<$Res> {
  factory $IllegalChoosenCopyWith(
          IllegalChoosen value, $Res Function(IllegalChoosen) _then) =
      _$IllegalChoosenCopyWithImpl;
  @useResult
  $Res call({String illegal});
}

/// @nodoc
class _$IllegalChoosenCopyWithImpl<$Res>
    implements $IllegalChoosenCopyWith<$Res> {
  _$IllegalChoosenCopyWithImpl(this._self, this._then);

  final IllegalChoosen _self;
  final $Res Function(IllegalChoosen) _then;

  /// Create a copy of ReportEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? illegal = null,
  }) {
    return _then(IllegalChoosen(
      illegal: null == illegal
          ? _self.illegal
          : illegal // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class AgreeCondition implements ReportEvent {
  const AgreeCondition({required this.agree});

  final bool agree;

  /// Create a copy of ReportEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AgreeConditionCopyWith<AgreeCondition> get copyWith =>
      _$AgreeConditionCopyWithImpl<AgreeCondition>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AgreeCondition &&
            (identical(other.agree, agree) || other.agree == agree));
  }

  @override
  int get hashCode => Object.hash(runtimeType, agree);

  @override
  String toString() {
    return 'ReportEvent.agreeCondition(agree: $agree)';
  }
}

/// @nodoc
abstract mixin class $AgreeConditionCopyWith<$Res>
    implements $ReportEventCopyWith<$Res> {
  factory $AgreeConditionCopyWith(
          AgreeCondition value, $Res Function(AgreeCondition) _then) =
      _$AgreeConditionCopyWithImpl;
  @useResult
  $Res call({bool agree});
}

/// @nodoc
class _$AgreeConditionCopyWithImpl<$Res>
    implements $AgreeConditionCopyWith<$Res> {
  _$AgreeConditionCopyWithImpl(this._self, this._then);

  final AgreeCondition _self;
  final $Res Function(AgreeCondition) _then;

  /// Create a copy of ReportEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? agree = null,
  }) {
    return _then(AgreeCondition(
      agree: null == agree
          ? _self.agree
          : agree // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$ReportState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ReportState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ReportState()';
  }
}

/// @nodoc
class $ReportStateCopyWith<$Res> {
  $ReportStateCopyWith(ReportState _, $Res Function(ReportState) __);
}

/// Adds pattern-matching-related methods to [ReportState].
extension ReportStatePatterns on ReportState {
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
    TResult Function(Violation value)? violation,
    TResult Function(Illegal value)? illegal,
    TResult Function(Agree value)? agree,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case Initial() when initial != null:
        return initial(_that);
      case Violation() when violation != null:
        return violation(_that);
      case Illegal() when illegal != null:
        return illegal(_that);
      case Agree() when agree != null:
        return agree(_that);
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
    required TResult Function(Violation value) violation,
    required TResult Function(Illegal value) illegal,
    required TResult Function(Agree value) agree,
  }) {
    final _that = this;
    switch (_that) {
      case Initial():
        return initial(_that);
      case Violation():
        return violation(_that);
      case Illegal():
        return illegal(_that);
      case Agree():
        return agree(_that);
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
    TResult? Function(Violation value)? violation,
    TResult? Function(Illegal value)? illegal,
    TResult? Function(Agree value)? agree,
  }) {
    final _that = this;
    switch (_that) {
      case Initial() when initial != null:
        return initial(_that);
      case Violation() when violation != null:
        return violation(_that);
      case Illegal() when illegal != null:
        return illegal(_that);
      case Agree() when agree != null:
        return agree(_that);
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
    TResult Function(String violation)? violation,
    TResult Function(String illegal)? illegal,
    TResult Function(bool agree)? agree,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case Initial() when initial != null:
        return initial();
      case Violation() when violation != null:
        return violation(_that.violation);
      case Illegal() when illegal != null:
        return illegal(_that.illegal);
      case Agree() when agree != null:
        return agree(_that.agree);
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
    required TResult Function(String violation) violation,
    required TResult Function(String illegal) illegal,
    required TResult Function(bool agree) agree,
  }) {
    final _that = this;
    switch (_that) {
      case Initial():
        return initial();
      case Violation():
        return violation(_that.violation);
      case Illegal():
        return illegal(_that.illegal);
      case Agree():
        return agree(_that.agree);
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
    TResult? Function(String violation)? violation,
    TResult? Function(String illegal)? illegal,
    TResult? Function(bool agree)? agree,
  }) {
    final _that = this;
    switch (_that) {
      case Initial() when initial != null:
        return initial();
      case Violation() when violation != null:
        return violation(_that.violation);
      case Illegal() when illegal != null:
        return illegal(_that.illegal);
      case Agree() when agree != null:
        return agree(_that.agree);
      case _:
        return null;
    }
  }
}

/// @nodoc

class Initial implements ReportState {
  const Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ReportState.initial()';
  }
}

/// @nodoc

class Violation implements ReportState {
  const Violation(this.violation);

  final String violation;

  /// Create a copy of ReportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ViolationCopyWith<Violation> get copyWith =>
      _$ViolationCopyWithImpl<Violation>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Violation &&
            (identical(other.violation, violation) ||
                other.violation == violation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, violation);

  @override
  String toString() {
    return 'ReportState.violation(violation: $violation)';
  }
}

/// @nodoc
abstract mixin class $ViolationCopyWith<$Res>
    implements $ReportStateCopyWith<$Res> {
  factory $ViolationCopyWith(Violation value, $Res Function(Violation) _then) =
      _$ViolationCopyWithImpl;
  @useResult
  $Res call({String violation});
}

/// @nodoc
class _$ViolationCopyWithImpl<$Res> implements $ViolationCopyWith<$Res> {
  _$ViolationCopyWithImpl(this._self, this._then);

  final Violation _self;
  final $Res Function(Violation) _then;

  /// Create a copy of ReportState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? violation = null,
  }) {
    return _then(Violation(
      null == violation
          ? _self.violation
          : violation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class Illegal implements ReportState {
  const Illegal(this.illegal);

  final String illegal;

  /// Create a copy of ReportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IllegalCopyWith<Illegal> get copyWith =>
      _$IllegalCopyWithImpl<Illegal>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Illegal &&
            (identical(other.illegal, illegal) || other.illegal == illegal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, illegal);

  @override
  String toString() {
    return 'ReportState.illegal(illegal: $illegal)';
  }
}

/// @nodoc
abstract mixin class $IllegalCopyWith<$Res>
    implements $ReportStateCopyWith<$Res> {
  factory $IllegalCopyWith(Illegal value, $Res Function(Illegal) _then) =
      _$IllegalCopyWithImpl;
  @useResult
  $Res call({String illegal});
}

/// @nodoc
class _$IllegalCopyWithImpl<$Res> implements $IllegalCopyWith<$Res> {
  _$IllegalCopyWithImpl(this._self, this._then);

  final Illegal _self;
  final $Res Function(Illegal) _then;

  /// Create a copy of ReportState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? illegal = null,
  }) {
    return _then(Illegal(
      null == illegal
          ? _self.illegal
          : illegal // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class Agree implements ReportState {
  const Agree(this.agree);

  final bool agree;

  /// Create a copy of ReportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AgreeCopyWith<Agree> get copyWith =>
      _$AgreeCopyWithImpl<Agree>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Agree &&
            (identical(other.agree, agree) || other.agree == agree));
  }

  @override
  int get hashCode => Object.hash(runtimeType, agree);

  @override
  String toString() {
    return 'ReportState.agree(agree: $agree)';
  }
}

/// @nodoc
abstract mixin class $AgreeCopyWith<$Res>
    implements $ReportStateCopyWith<$Res> {
  factory $AgreeCopyWith(Agree value, $Res Function(Agree) _then) =
      _$AgreeCopyWithImpl;
  @useResult
  $Res call({bool agree});
}

/// @nodoc
class _$AgreeCopyWithImpl<$Res> implements $AgreeCopyWith<$Res> {
  _$AgreeCopyWithImpl(this._self, this._then);

  final Agree _self;
  final $Res Function(Agree) _then;

  /// Create a copy of ReportState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? agree = null,
  }) {
    return _then(Agree(
      null == agree
          ? _self.agree
          : agree // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
