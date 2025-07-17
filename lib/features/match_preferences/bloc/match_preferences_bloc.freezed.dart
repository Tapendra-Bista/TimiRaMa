// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_preferences_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchPreferencesEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MatchPreferencesEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MatchPreferencesEvent()';
  }
}

/// @nodoc
class $MatchPreferencesEventCopyWith<$Res> {
  $MatchPreferencesEventCopyWith(
      MatchPreferencesEvent _, $Res Function(MatchPreferencesEvent) __);
}

/// Adds pattern-matching-related methods to [MatchPreferencesEvent].
extension MatchPreferencesEventPatterns on MatchPreferencesEvent {
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
    TResult Function(GenderMatchPreferencesRequested value)?
        genderMatchPreferencesRequested,
    TResult Function(AgeMatchPreferencesRequested value)?
        ageMatchPreferencesRequested,
    TResult Function(LocationMatchPreferencesRequested value)?
        locationMatchPreferencesRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GenderMatchPreferencesRequested()
          when genderMatchPreferencesRequested != null:
        return genderMatchPreferencesRequested(_that);
      case AgeMatchPreferencesRequested()
          when ageMatchPreferencesRequested != null:
        return ageMatchPreferencesRequested(_that);
      case LocationMatchPreferencesRequested()
          when locationMatchPreferencesRequested != null:
        return locationMatchPreferencesRequested(_that);
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
    required TResult Function(GenderMatchPreferencesRequested value)
        genderMatchPreferencesRequested,
    required TResult Function(AgeMatchPreferencesRequested value)
        ageMatchPreferencesRequested,
    required TResult Function(LocationMatchPreferencesRequested value)
        locationMatchPreferencesRequested,
  }) {
    final _that = this;
    switch (_that) {
      case GenderMatchPreferencesRequested():
        return genderMatchPreferencesRequested(_that);
      case AgeMatchPreferencesRequested():
        return ageMatchPreferencesRequested(_that);
      case LocationMatchPreferencesRequested():
        return locationMatchPreferencesRequested(_that);
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
    TResult? Function(GenderMatchPreferencesRequested value)?
        genderMatchPreferencesRequested,
    TResult? Function(AgeMatchPreferencesRequested value)?
        ageMatchPreferencesRequested,
    TResult? Function(LocationMatchPreferencesRequested value)?
        locationMatchPreferencesRequested,
  }) {
    final _that = this;
    switch (_that) {
      case GenderMatchPreferencesRequested()
          when genderMatchPreferencesRequested != null:
        return genderMatchPreferencesRequested(_that);
      case AgeMatchPreferencesRequested()
          when ageMatchPreferencesRequested != null:
        return ageMatchPreferencesRequested(_that);
      case LocationMatchPreferencesRequested()
          when locationMatchPreferencesRequested != null:
        return locationMatchPreferencesRequested(_that);
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
        genderMatchPreferencesRequested,
    TResult Function(double start, double end)? ageMatchPreferencesRequested,
    TResult Function(String country, bool isCountryClicked, String city,
            bool isCityClicked)?
        locationMatchPreferencesRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GenderMatchPreferencesRequested()
          when genderMatchPreferencesRequested != null:
        return genderMatchPreferencesRequested(
            _that.men, _that.isMenClicked, _that.women, _that.isWomenClicked);
      case AgeMatchPreferencesRequested()
          when ageMatchPreferencesRequested != null:
        return ageMatchPreferencesRequested(_that.start, _that.end);
      case LocationMatchPreferencesRequested()
          when locationMatchPreferencesRequested != null:
        return locationMatchPreferencesRequested(_that.country,
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
        genderMatchPreferencesRequested,
    required TResult Function(double start, double end)
        ageMatchPreferencesRequested,
    required TResult Function(String country, bool isCountryClicked,
            String city, bool isCityClicked)
        locationMatchPreferencesRequested,
  }) {
    final _that = this;
    switch (_that) {
      case GenderMatchPreferencesRequested():
        return genderMatchPreferencesRequested(
            _that.men, _that.isMenClicked, _that.women, _that.isWomenClicked);
      case AgeMatchPreferencesRequested():
        return ageMatchPreferencesRequested(_that.start, _that.end);
      case LocationMatchPreferencesRequested():
        return locationMatchPreferencesRequested(_that.country,
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
        genderMatchPreferencesRequested,
    TResult? Function(double start, double end)? ageMatchPreferencesRequested,
    TResult? Function(String country, bool isCountryClicked, String city,
            bool isCityClicked)?
        locationMatchPreferencesRequested,
  }) {
    final _that = this;
    switch (_that) {
      case GenderMatchPreferencesRequested()
          when genderMatchPreferencesRequested != null:
        return genderMatchPreferencesRequested(
            _that.men, _that.isMenClicked, _that.women, _that.isWomenClicked);
      case AgeMatchPreferencesRequested()
          when ageMatchPreferencesRequested != null:
        return ageMatchPreferencesRequested(_that.start, _that.end);
      case LocationMatchPreferencesRequested()
          when locationMatchPreferencesRequested != null:
        return locationMatchPreferencesRequested(_that.country,
            _that.isCountryClicked, _that.city, _that.isCityClicked);
      case _:
        return null;
    }
  }
}

/// @nodoc

class GenderMatchPreferencesRequested implements MatchPreferencesEvent {
  const GenderMatchPreferencesRequested(
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

  /// Create a copy of MatchPreferencesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GenderMatchPreferencesRequestedCopyWith<GenderMatchPreferencesRequested>
      get copyWith => _$GenderMatchPreferencesRequestedCopyWithImpl<
          GenderMatchPreferencesRequested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GenderMatchPreferencesRequested &&
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
    return 'MatchPreferencesEvent.genderMatchPreferencesRequested(men: $men, isMenClicked: $isMenClicked, women: $women, isWomenClicked: $isWomenClicked)';
  }
}

/// @nodoc
abstract mixin class $GenderMatchPreferencesRequestedCopyWith<$Res>
    implements $MatchPreferencesEventCopyWith<$Res> {
  factory $GenderMatchPreferencesRequestedCopyWith(
          GenderMatchPreferencesRequested value,
          $Res Function(GenderMatchPreferencesRequested) _then) =
      _$GenderMatchPreferencesRequestedCopyWithImpl;
  @useResult
  $Res call({String men, bool isMenClicked, String women, bool isWomenClicked});
}

/// @nodoc
class _$GenderMatchPreferencesRequestedCopyWithImpl<$Res>
    implements $GenderMatchPreferencesRequestedCopyWith<$Res> {
  _$GenderMatchPreferencesRequestedCopyWithImpl(this._self, this._then);

  final GenderMatchPreferencesRequested _self;
  final $Res Function(GenderMatchPreferencesRequested) _then;

  /// Create a copy of MatchPreferencesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? men = null,
    Object? isMenClicked = null,
    Object? women = null,
    Object? isWomenClicked = null,
  }) {
    return _then(GenderMatchPreferencesRequested(
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

class AgeMatchPreferencesRequested implements MatchPreferencesEvent {
  const AgeMatchPreferencesRequested(this.start, this.end);

  final double start;
  final double end;

  /// Create a copy of MatchPreferencesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AgeMatchPreferencesRequestedCopyWith<AgeMatchPreferencesRequested>
      get copyWith => _$AgeMatchPreferencesRequestedCopyWithImpl<
          AgeMatchPreferencesRequested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AgeMatchPreferencesRequested &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @override
  int get hashCode => Object.hash(runtimeType, start, end);

  @override
  String toString() {
    return 'MatchPreferencesEvent.ageMatchPreferencesRequested(start: $start, end: $end)';
  }
}

/// @nodoc
abstract mixin class $AgeMatchPreferencesRequestedCopyWith<$Res>
    implements $MatchPreferencesEventCopyWith<$Res> {
  factory $AgeMatchPreferencesRequestedCopyWith(
          AgeMatchPreferencesRequested value,
          $Res Function(AgeMatchPreferencesRequested) _then) =
      _$AgeMatchPreferencesRequestedCopyWithImpl;
  @useResult
  $Res call({double start, double end});
}

/// @nodoc
class _$AgeMatchPreferencesRequestedCopyWithImpl<$Res>
    implements $AgeMatchPreferencesRequestedCopyWith<$Res> {
  _$AgeMatchPreferencesRequestedCopyWithImpl(this._self, this._then);

  final AgeMatchPreferencesRequested _self;
  final $Res Function(AgeMatchPreferencesRequested) _then;

  /// Create a copy of MatchPreferencesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? start = null,
    Object? end = null,
  }) {
    return _then(AgeMatchPreferencesRequested(
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

class LocationMatchPreferencesRequested implements MatchPreferencesEvent {
  const LocationMatchPreferencesRequested(
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

  /// Create a copy of MatchPreferencesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LocationMatchPreferencesRequestedCopyWith<LocationMatchPreferencesRequested>
      get copyWith => _$LocationMatchPreferencesRequestedCopyWithImpl<
          LocationMatchPreferencesRequested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LocationMatchPreferencesRequested &&
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
    return 'MatchPreferencesEvent.locationMatchPreferencesRequested(country: $country, isCountryClicked: $isCountryClicked, city: $city, isCityClicked: $isCityClicked)';
  }
}

/// @nodoc
abstract mixin class $LocationMatchPreferencesRequestedCopyWith<$Res>
    implements $MatchPreferencesEventCopyWith<$Res> {
  factory $LocationMatchPreferencesRequestedCopyWith(
          LocationMatchPreferencesRequested value,
          $Res Function(LocationMatchPreferencesRequested) _then) =
      _$LocationMatchPreferencesRequestedCopyWithImpl;
  @useResult
  $Res call(
      {String country, bool isCountryClicked, String city, bool isCityClicked});
}

/// @nodoc
class _$LocationMatchPreferencesRequestedCopyWithImpl<$Res>
    implements $LocationMatchPreferencesRequestedCopyWith<$Res> {
  _$LocationMatchPreferencesRequestedCopyWithImpl(this._self, this._then);

  final LocationMatchPreferencesRequested _self;
  final $Res Function(LocationMatchPreferencesRequested) _then;

  /// Create a copy of MatchPreferencesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? country = null,
    Object? isCountryClicked = null,
    Object? city = null,
    Object? isCityClicked = null,
  }) {
    return _then(LocationMatchPreferencesRequested(
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
mixin _$MatchPreferencesState {
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

  /// Create a copy of MatchPreferencesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MatchPreferencesStateCopyWith<MatchPreferencesState> get copyWith =>
      _$MatchPreferencesStateCopyWithImpl<MatchPreferencesState>(
          this as MatchPreferencesState, _$identity);

  /// Serializes this MatchPreferencesState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchPreferencesState &&
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
    return 'MatchPreferencesState(men: $men, isMenClicked: $isMenClicked, women: $women, isWomenClicked: $isWomenClicked, start: $start, end: $end, country: $country, city: $city, isCityClicked: $isCityClicked, isCountryClicked: $isCountryClicked)';
  }
}

/// @nodoc
abstract mixin class $MatchPreferencesStateCopyWith<$Res> {
  factory $MatchPreferencesStateCopyWith(MatchPreferencesState value,
          $Res Function(MatchPreferencesState) _then) =
      _$MatchPreferencesStateCopyWithImpl;
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
class _$MatchPreferencesStateCopyWithImpl<$Res>
    implements $MatchPreferencesStateCopyWith<$Res> {
  _$MatchPreferencesStateCopyWithImpl(this._self, this._then);

  final MatchPreferencesState _self;
  final $Res Function(MatchPreferencesState) _then;

  /// Create a copy of MatchPreferencesState
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

/// Adds pattern-matching-related methods to [MatchPreferencesState].
extension MatchPreferencesStatePatterns on MatchPreferencesState {
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
    TResult Function(_MatchPreferencesState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MatchPreferencesState() when $default != null:
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
    TResult Function(_MatchPreferencesState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MatchPreferencesState():
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
    TResult? Function(_MatchPreferencesState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MatchPreferencesState() when $default != null:
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
      case _MatchPreferencesState() when $default != null:
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
      case _MatchPreferencesState():
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
      case _MatchPreferencesState() when $default != null:
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
class _MatchPreferencesState implements MatchPreferencesState {
  const _MatchPreferencesState(
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
  factory _MatchPreferencesState.fromJson(Map<String, dynamic> json) =>
      _$MatchPreferencesStateFromJson(json);

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

  /// Create a copy of MatchPreferencesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MatchPreferencesStateCopyWith<_MatchPreferencesState> get copyWith =>
      __$MatchPreferencesStateCopyWithImpl<_MatchPreferencesState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MatchPreferencesStateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MatchPreferencesState &&
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
    return 'MatchPreferencesState(men: $men, isMenClicked: $isMenClicked, women: $women, isWomenClicked: $isWomenClicked, start: $start, end: $end, country: $country, city: $city, isCityClicked: $isCityClicked, isCountryClicked: $isCountryClicked)';
  }
}

/// @nodoc
abstract mixin class _$MatchPreferencesStateCopyWith<$Res>
    implements $MatchPreferencesStateCopyWith<$Res> {
  factory _$MatchPreferencesStateCopyWith(_MatchPreferencesState value,
          $Res Function(_MatchPreferencesState) _then) =
      __$MatchPreferencesStateCopyWithImpl;
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
class __$MatchPreferencesStateCopyWithImpl<$Res>
    implements _$MatchPreferencesStateCopyWith<$Res> {
  __$MatchPreferencesStateCopyWithImpl(this._self, this._then);

  final _MatchPreferencesState _self;
  final $Res Function(_MatchPreferencesState) _then;

  /// Create a copy of MatchPreferencesState
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
    return _then(_MatchPreferencesState(
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
