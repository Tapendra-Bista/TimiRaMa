// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preferences_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PreferencesEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PreferencesEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PreferencesEvent()';
  }
}

/// @nodoc
class $PreferencesEventCopyWith<$Res> {
  $PreferencesEventCopyWith(
      PreferencesEvent _, $Res Function(PreferencesEvent) __);
}

/// Adds pattern-matching-related methods to [PreferencesEvent].
extension PreferencesEventPatterns on PreferencesEvent {
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
    TResult Function(GenderPreferencesRequested value)?
        genderPreferencesRequested,
    TResult Function(AgePreferencesRequested value)? agePreferencesRequested,
    TResult Function(LocationPreferencesRequested value)?
        locationPreferencesRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GenderPreferencesRequested() when genderPreferencesRequested != null:
        return genderPreferencesRequested(_that);
      case AgePreferencesRequested() when agePreferencesRequested != null:
        return agePreferencesRequested(_that);
      case LocationPreferencesRequested()
          when locationPreferencesRequested != null:
        return locationPreferencesRequested(_that);
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
    required TResult Function(GenderPreferencesRequested value)
        genderPreferencesRequested,
    required TResult Function(AgePreferencesRequested value)
        agePreferencesRequested,
    required TResult Function(LocationPreferencesRequested value)
        locationPreferencesRequested,
  }) {
    final _that = this;
    switch (_that) {
      case GenderPreferencesRequested():
        return genderPreferencesRequested(_that);
      case AgePreferencesRequested():
        return agePreferencesRequested(_that);
      case LocationPreferencesRequested():
        return locationPreferencesRequested(_that);
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
    TResult? Function(GenderPreferencesRequested value)?
        genderPreferencesRequested,
    TResult? Function(AgePreferencesRequested value)? agePreferencesRequested,
    TResult? Function(LocationPreferencesRequested value)?
        locationPreferencesRequested,
  }) {
    final _that = this;
    switch (_that) {
      case GenderPreferencesRequested() when genderPreferencesRequested != null:
        return genderPreferencesRequested(_that);
      case AgePreferencesRequested() when agePreferencesRequested != null:
        return agePreferencesRequested(_that);
      case LocationPreferencesRequested()
          when locationPreferencesRequested != null:
        return locationPreferencesRequested(_that);
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
    TResult Function(
            String men, bool isMenClicked, String women, bool isWomenClicked)?
        genderPreferencesRequested,
    TResult Function(double start, double end)? agePreferencesRequested,
    TResult Function(String country, bool isCountryClicked, String city,
            bool isCityClicked)?
        locationPreferencesRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GenderPreferencesRequested() when genderPreferencesRequested != null:
        return genderPreferencesRequested(
            _that.men, _that.isMenClicked, _that.women, _that.isWomenClicked);
      case AgePreferencesRequested() when agePreferencesRequested != null:
        return agePreferencesRequested(_that.start, _that.end);
      case LocationPreferencesRequested()
          when locationPreferencesRequested != null:
        return locationPreferencesRequested(_that.country,
            _that.isCountryClicked, _that.city, _that.isCityClicked);
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
    required TResult Function(
            String men, bool isMenClicked, String women, bool isWomenClicked)
        genderPreferencesRequested,
    required TResult Function(double start, double end) agePreferencesRequested,
    required TResult Function(String country, bool isCountryClicked,
            String city, bool isCityClicked)
        locationPreferencesRequested,
  }) {
    final _that = this;
    switch (_that) {
      case GenderPreferencesRequested():
        return genderPreferencesRequested(
            _that.men, _that.isMenClicked, _that.women, _that.isWomenClicked);
      case AgePreferencesRequested():
        return agePreferencesRequested(_that.start, _that.end);
      case LocationPreferencesRequested():
        return locationPreferencesRequested(_that.country,
            _that.isCountryClicked, _that.city, _that.isCityClicked);
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
    TResult? Function(
            String men, bool isMenClicked, String women, bool isWomenClicked)?
        genderPreferencesRequested,
    TResult? Function(double start, double end)? agePreferencesRequested,
    TResult? Function(String country, bool isCountryClicked, String city,
            bool isCityClicked)?
        locationPreferencesRequested,
  }) {
    final _that = this;
    switch (_that) {
      case GenderPreferencesRequested() when genderPreferencesRequested != null:
        return genderPreferencesRequested(
            _that.men, _that.isMenClicked, _that.women, _that.isWomenClicked);
      case AgePreferencesRequested() when agePreferencesRequested != null:
        return agePreferencesRequested(_that.start, _that.end);
      case LocationPreferencesRequested()
          when locationPreferencesRequested != null:
        return locationPreferencesRequested(_that.country,
            _that.isCountryClicked, _that.city, _that.isCityClicked);
      case _:
        return null;
    }
  }
}

/// @nodoc

class GenderPreferencesRequested implements PreferencesEvent {
  const GenderPreferencesRequested(
      {this.men = '',
      this.isMenClicked = false,
      this.women = '',
      this.isWomenClicked = false});

  @JsonKey()
  final String men;
  @JsonKey()
  final bool isMenClicked;
  @JsonKey()
  final String women;
  @JsonKey()
  final bool isWomenClicked;

  /// Create a copy of PreferencesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GenderPreferencesRequestedCopyWith<GenderPreferencesRequested>
      get copyWith =>
          _$GenderPreferencesRequestedCopyWithImpl<GenderPreferencesRequested>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GenderPreferencesRequested &&
            (identical(other.men, men) || other.men == men) &&
            (identical(other.isMenClicked, isMenClicked) ||
                other.isMenClicked == isMenClicked) &&
            (identical(other.women, women) || other.women == women) &&
            (identical(other.isWomenClicked, isWomenClicked) ||
                other.isWomenClicked == isWomenClicked));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, men, isMenClicked, women, isWomenClicked);

  @override
  String toString() {
    return 'PreferencesEvent.genderPreferencesRequested(men: $men, isMenClicked: $isMenClicked, women: $women, isWomenClicked: $isWomenClicked)';
  }
}

/// @nodoc
abstract mixin class $GenderPreferencesRequestedCopyWith<$Res>
    implements $PreferencesEventCopyWith<$Res> {
  factory $GenderPreferencesRequestedCopyWith(GenderPreferencesRequested value,
          $Res Function(GenderPreferencesRequested) _then) =
      _$GenderPreferencesRequestedCopyWithImpl;
  @useResult
  $Res call({String men, bool isMenClicked, String women, bool isWomenClicked});
}

/// @nodoc
class _$GenderPreferencesRequestedCopyWithImpl<$Res>
    implements $GenderPreferencesRequestedCopyWith<$Res> {
  _$GenderPreferencesRequestedCopyWithImpl(this._self, this._then);

  final GenderPreferencesRequested _self;
  final $Res Function(GenderPreferencesRequested) _then;

  /// Create a copy of PreferencesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? men = null,
    Object? isMenClicked = null,
    Object? women = null,
    Object? isWomenClicked = null,
  }) {
    return _then(GenderPreferencesRequested(
      men: null == men
          ? _self.men
          : men // ignore: cast_nullable_to_non_nullable
              as String,
      isMenClicked: null == isMenClicked
          ? _self.isMenClicked
          : isMenClicked // ignore: cast_nullable_to_non_nullable
              as bool,
      women: null == women
          ? _self.women
          : women // ignore: cast_nullable_to_non_nullable
              as String,
      isWomenClicked: null == isWomenClicked
          ? _self.isWomenClicked
          : isWomenClicked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class AgePreferencesRequested implements PreferencesEvent {
  const AgePreferencesRequested(this.start, this.end);

  final double start;
  final double end;

  /// Create a copy of PreferencesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AgePreferencesRequestedCopyWith<AgePreferencesRequested> get copyWith =>
      _$AgePreferencesRequestedCopyWithImpl<AgePreferencesRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AgePreferencesRequested &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @override
  int get hashCode => Object.hash(runtimeType, start, end);

  @override
  String toString() {
    return 'PreferencesEvent.agePreferencesRequested(start: $start, end: $end)';
  }
}

/// @nodoc
abstract mixin class $AgePreferencesRequestedCopyWith<$Res>
    implements $PreferencesEventCopyWith<$Res> {
  factory $AgePreferencesRequestedCopyWith(AgePreferencesRequested value,
          $Res Function(AgePreferencesRequested) _then) =
      _$AgePreferencesRequestedCopyWithImpl;
  @useResult
  $Res call({double start, double end});
}

/// @nodoc
class _$AgePreferencesRequestedCopyWithImpl<$Res>
    implements $AgePreferencesRequestedCopyWith<$Res> {
  _$AgePreferencesRequestedCopyWithImpl(this._self, this._then);

  final AgePreferencesRequested _self;
  final $Res Function(AgePreferencesRequested) _then;

  /// Create a copy of PreferencesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? start = null,
    Object? end = null,
  }) {
    return _then(AgePreferencesRequested(
      null == start
          ? _self.start
          : start // ignore: cast_nullable_to_non_nullable
              as double,
      null == end
          ? _self.end
          : end // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class LocationPreferencesRequested implements PreferencesEvent {
  const LocationPreferencesRequested(
      {this.country = '',
      this.isCountryClicked = false,
      this.city = '',
      this.isCityClicked = false});

  @JsonKey()
  final String country;
  @JsonKey()
  final bool isCountryClicked;
  @JsonKey()
  final String city;
  @JsonKey()
  final bool isCityClicked;

  /// Create a copy of PreferencesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LocationPreferencesRequestedCopyWith<LocationPreferencesRequested>
      get copyWith => _$LocationPreferencesRequestedCopyWithImpl<
          LocationPreferencesRequested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LocationPreferencesRequested &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.isCountryClicked, isCountryClicked) ||
                other.isCountryClicked == isCountryClicked) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.isCityClicked, isCityClicked) ||
                other.isCityClicked == isCityClicked));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, country, isCountryClicked, city, isCityClicked);

  @override
  String toString() {
    return 'PreferencesEvent.locationPreferencesRequested(country: $country, isCountryClicked: $isCountryClicked, city: $city, isCityClicked: $isCityClicked)';
  }
}

/// @nodoc
abstract mixin class $LocationPreferencesRequestedCopyWith<$Res>
    implements $PreferencesEventCopyWith<$Res> {
  factory $LocationPreferencesRequestedCopyWith(
          LocationPreferencesRequested value,
          $Res Function(LocationPreferencesRequested) _then) =
      _$LocationPreferencesRequestedCopyWithImpl;
  @useResult
  $Res call(
      {String country, bool isCountryClicked, String city, bool isCityClicked});
}

/// @nodoc
class _$LocationPreferencesRequestedCopyWithImpl<$Res>
    implements $LocationPreferencesRequestedCopyWith<$Res> {
  _$LocationPreferencesRequestedCopyWithImpl(this._self, this._then);

  final LocationPreferencesRequested _self;
  final $Res Function(LocationPreferencesRequested) _then;

  /// Create a copy of PreferencesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? country = null,
    Object? isCountryClicked = null,
    Object? city = null,
    Object? isCityClicked = null,
  }) {
    return _then(LocationPreferencesRequested(
      country: null == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      isCountryClicked: null == isCountryClicked
          ? _self.isCountryClicked
          : isCountryClicked // ignore: cast_nullable_to_non_nullable
              as bool,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      isCityClicked: null == isCityClicked
          ? _self.isCityClicked
          : isCityClicked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$PreferencesState {
  String get men;
  bool get isMenClicked;
  String get women;
  bool get isWomenClicked;
  double get start;
  double get end;
  String get country;
  String get city;
  bool get isCityClicked;
  bool get isCountryClicked;

  /// Create a copy of PreferencesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PreferencesStateCopyWith<PreferencesState> get copyWith =>
      _$PreferencesStateCopyWithImpl<PreferencesState>(
          this as PreferencesState, _$identity);

  /// Serializes this PreferencesState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PreferencesState &&
            (identical(other.men, men) || other.men == men) &&
            (identical(other.isMenClicked, isMenClicked) ||
                other.isMenClicked == isMenClicked) &&
            (identical(other.women, women) || other.women == women) &&
            (identical(other.isWomenClicked, isWomenClicked) ||
                other.isWomenClicked == isWomenClicked) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.isCityClicked, isCityClicked) ||
                other.isCityClicked == isCityClicked) &&
            (identical(other.isCountryClicked, isCountryClicked) ||
                other.isCountryClicked == isCountryClicked));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      men,
      isMenClicked,
      women,
      isWomenClicked,
      start,
      end,
      country,
      city,
      isCityClicked,
      isCountryClicked);

  @override
  String toString() {
    return 'PreferencesState(men: $men, isMenClicked: $isMenClicked, women: $women, isWomenClicked: $isWomenClicked, start: $start, end: $end, country: $country, city: $city, isCityClicked: $isCityClicked, isCountryClicked: $isCountryClicked)';
  }
}

/// @nodoc
abstract mixin class $PreferencesStateCopyWith<$Res> {
  factory $PreferencesStateCopyWith(
          PreferencesState value, $Res Function(PreferencesState) _then) =
      _$PreferencesStateCopyWithImpl;
  @useResult
  $Res call(
      {String men,
      bool isMenClicked,
      String women,
      bool isWomenClicked,
      double start,
      double end,
      String country,
      String city,
      bool isCityClicked,
      bool isCountryClicked});
}

/// @nodoc
class _$PreferencesStateCopyWithImpl<$Res>
    implements $PreferencesStateCopyWith<$Res> {
  _$PreferencesStateCopyWithImpl(this._self, this._then);

  final PreferencesState _self;
  final $Res Function(PreferencesState) _then;

  /// Create a copy of PreferencesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? men = null,
    Object? isMenClicked = null,
    Object? women = null,
    Object? isWomenClicked = null,
    Object? start = null,
    Object? end = null,
    Object? country = null,
    Object? city = null,
    Object? isCityClicked = null,
    Object? isCountryClicked = null,
  }) {
    return _then(_self.copyWith(
      men: null == men
          ? _self.men
          : men // ignore: cast_nullable_to_non_nullable
              as String,
      isMenClicked: null == isMenClicked
          ? _self.isMenClicked
          : isMenClicked // ignore: cast_nullable_to_non_nullable
              as bool,
      women: null == women
          ? _self.women
          : women // ignore: cast_nullable_to_non_nullable
              as String,
      isWomenClicked: null == isWomenClicked
          ? _self.isWomenClicked
          : isWomenClicked // ignore: cast_nullable_to_non_nullable
              as bool,
      start: null == start
          ? _self.start
          : start // ignore: cast_nullable_to_non_nullable
              as double,
      end: null == end
          ? _self.end
          : end // ignore: cast_nullable_to_non_nullable
              as double,
      country: null == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      isCityClicked: null == isCityClicked
          ? _self.isCityClicked
          : isCityClicked // ignore: cast_nullable_to_non_nullable
              as bool,
      isCountryClicked: null == isCountryClicked
          ? _self.isCountryClicked
          : isCountryClicked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [PreferencesState].
extension PreferencesStatePatterns on PreferencesState {
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
    TResult Function(_PreferencesState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PreferencesState() when $default != null:
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
    TResult Function(_PreferencesState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PreferencesState():
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
    TResult? Function(_PreferencesState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PreferencesState() when $default != null:
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
            String men,
            bool isMenClicked,
            String women,
            bool isWomenClicked,
            double start,
            double end,
            String country,
            String city,
            bool isCityClicked,
            bool isCountryClicked)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PreferencesState() when $default != null:
        return $default(
            _that.men,
            _that.isMenClicked,
            _that.women,
            _that.isWomenClicked,
            _that.start,
            _that.end,
            _that.country,
            _that.city,
            _that.isCityClicked,
            _that.isCountryClicked);
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
            String men,
            bool isMenClicked,
            String women,
            bool isWomenClicked,
            double start,
            double end,
            String country,
            String city,
            bool isCityClicked,
            bool isCountryClicked)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PreferencesState():
        return $default(
            _that.men,
            _that.isMenClicked,
            _that.women,
            _that.isWomenClicked,
            _that.start,
            _that.end,
            _that.country,
            _that.city,
            _that.isCityClicked,
            _that.isCountryClicked);
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
            String men,
            bool isMenClicked,
            String women,
            bool isWomenClicked,
            double start,
            double end,
            String country,
            String city,
            bool isCityClicked,
            bool isCountryClicked)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PreferencesState() when $default != null:
        return $default(
            _that.men,
            _that.isMenClicked,
            _that.women,
            _that.isWomenClicked,
            _that.start,
            _that.end,
            _that.country,
            _that.city,
            _that.isCityClicked,
            _that.isCountryClicked);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PreferencesState implements PreferencesState {
  const _PreferencesState(
      {this.men = '',
      this.isMenClicked = false,
      this.women = '',
      this.isWomenClicked = false,
      this.start = 18.0,
      this.end = 60.0,
      this.country = '',
      this.city = '',
      this.isCityClicked = false,
      this.isCountryClicked = false});
  factory _PreferencesState.fromJson(Map<String, dynamic> json) =>
      _$PreferencesStateFromJson(json);

  @override
  @JsonKey()
  final String men;
  @override
  @JsonKey()
  final bool isMenClicked;
  @override
  @JsonKey()
  final String women;
  @override
  @JsonKey()
  final bool isWomenClicked;
  @override
  @JsonKey()
  final double start;
  @override
  @JsonKey()
  final double end;
  @override
  @JsonKey()
  final String country;
  @override
  @JsonKey()
  final String city;
  @override
  @JsonKey()
  final bool isCityClicked;
  @override
  @JsonKey()
  final bool isCountryClicked;

  /// Create a copy of PreferencesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PreferencesStateCopyWith<_PreferencesState> get copyWith =>
      __$PreferencesStateCopyWithImpl<_PreferencesState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PreferencesStateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PreferencesState &&
            (identical(other.men, men) || other.men == men) &&
            (identical(other.isMenClicked, isMenClicked) ||
                other.isMenClicked == isMenClicked) &&
            (identical(other.women, women) || other.women == women) &&
            (identical(other.isWomenClicked, isWomenClicked) ||
                other.isWomenClicked == isWomenClicked) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.isCityClicked, isCityClicked) ||
                other.isCityClicked == isCityClicked) &&
            (identical(other.isCountryClicked, isCountryClicked) ||
                other.isCountryClicked == isCountryClicked));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      men,
      isMenClicked,
      women,
      isWomenClicked,
      start,
      end,
      country,
      city,
      isCityClicked,
      isCountryClicked);

  @override
  String toString() {
    return 'PreferencesState(men: $men, isMenClicked: $isMenClicked, women: $women, isWomenClicked: $isWomenClicked, start: $start, end: $end, country: $country, city: $city, isCityClicked: $isCityClicked, isCountryClicked: $isCountryClicked)';
  }
}

/// @nodoc
abstract mixin class _$PreferencesStateCopyWith<$Res>
    implements $PreferencesStateCopyWith<$Res> {
  factory _$PreferencesStateCopyWith(
          _PreferencesState value, $Res Function(_PreferencesState) _then) =
      __$PreferencesStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String men,
      bool isMenClicked,
      String women,
      bool isWomenClicked,
      double start,
      double end,
      String country,
      String city,
      bool isCityClicked,
      bool isCountryClicked});
}

/// @nodoc
class __$PreferencesStateCopyWithImpl<$Res>
    implements _$PreferencesStateCopyWith<$Res> {
  __$PreferencesStateCopyWithImpl(this._self, this._then);

  final _PreferencesState _self;
  final $Res Function(_PreferencesState) _then;

  /// Create a copy of PreferencesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? men = null,
    Object? isMenClicked = null,
    Object? women = null,
    Object? isWomenClicked = null,
    Object? start = null,
    Object? end = null,
    Object? country = null,
    Object? city = null,
    Object? isCityClicked = null,
    Object? isCountryClicked = null,
  }) {
    return _then(_PreferencesState(
      men: null == men
          ? _self.men
          : men // ignore: cast_nullable_to_non_nullable
              as String,
      isMenClicked: null == isMenClicked
          ? _self.isMenClicked
          : isMenClicked // ignore: cast_nullable_to_non_nullable
              as bool,
      women: null == women
          ? _self.women
          : women // ignore: cast_nullable_to_non_nullable
              as String,
      isWomenClicked: null == isWomenClicked
          ? _self.isWomenClicked
          : isWomenClicked // ignore: cast_nullable_to_non_nullable
              as bool,
      start: null == start
          ? _self.start
          : start // ignore: cast_nullable_to_non_nullable
              as double,
      end: null == end
          ? _self.end
          : end // ignore: cast_nullable_to_non_nullable
              as double,
      country: null == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      isCityClicked: null == isCityClicked
          ? _self.isCityClicked
          : isCityClicked // ignore: cast_nullable_to_non_nullable
              as bool,
      isCountryClicked: null == isCountryClicked
          ? _self.isCountryClicked
          : isCountryClicked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
