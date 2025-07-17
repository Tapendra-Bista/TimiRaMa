// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stories_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StoriesEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is StoriesEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'StoriesEvent()';
  }
}

/// @nodoc
class $StoriesEventCopyWith<$Res> {
  $StoriesEventCopyWith(StoriesEvent _, $Res Function(StoriesEvent) __);
}

/// Adds pattern-matching-related methods to [StoriesEvent].
extension StoriesEventPatterns on StoriesEvent {
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
    TResult Function(StoriesFetching value)? fetching,
    TResult Function(StoriesImage value)? storiesImage,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case StoriesFetching() when fetching != null:
        return fetching(_that);
      case StoriesImage() when storiesImage != null:
        return storiesImage(_that);
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
    required TResult Function(StoriesFetching value) fetching,
    required TResult Function(StoriesImage value) storiesImage,
  }) {
    final _that = this;
    switch (_that) {
      case StoriesFetching():
        return fetching(_that);
      case StoriesImage():
        return storiesImage(_that);
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
    TResult? Function(StoriesFetching value)? fetching,
    TResult? Function(StoriesImage value)? storiesImage,
  }) {
    final _that = this;
    switch (_that) {
      case StoriesFetching() when fetching != null:
        return fetching(_that);
      case StoriesImage() when storiesImage != null:
        return storiesImage(_that);
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
    TResult Function()? fetching,
    TResult Function(String name, String img, ImageSource source)? storiesImage,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case StoriesFetching() when fetching != null:
        return fetching();
      case StoriesImage() when storiesImage != null:
        return storiesImage(_that.name, _that.img, _that.source);
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
    required TResult Function() fetching,
    required TResult Function(String name, String img, ImageSource source)
        storiesImage,
  }) {
    final _that = this;
    switch (_that) {
      case StoriesFetching():
        return fetching();
      case StoriesImage():
        return storiesImage(_that.name, _that.img, _that.source);
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
    TResult? Function()? fetching,
    TResult? Function(String name, String img, ImageSource source)?
        storiesImage,
  }) {
    final _that = this;
    switch (_that) {
      case StoriesFetching() when fetching != null:
        return fetching();
      case StoriesImage() when storiesImage != null:
        return storiesImage(_that.name, _that.img, _that.source);
      case _:
        return null;
    }
  }
}

/// @nodoc

class StoriesFetching implements StoriesEvent {
  const StoriesFetching();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is StoriesFetching);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'StoriesEvent.fetching()';
  }
}

/// @nodoc

class StoriesImage implements StoriesEvent {
  const StoriesImage(
      {required this.name, required this.img, required this.source});

  final String name;
  final String img;
  final ImageSource source;

  /// Create a copy of StoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StoriesImageCopyWith<StoriesImage> get copyWith =>
      _$StoriesImageCopyWithImpl<StoriesImage>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StoriesImage &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.img, img) || other.img == img) &&
            (identical(other.source, source) || other.source == source));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, img, source);

  @override
  String toString() {
    return 'StoriesEvent.storiesImage(name: $name, img: $img, source: $source)';
  }
}

/// @nodoc
abstract mixin class $StoriesImageCopyWith<$Res>
    implements $StoriesEventCopyWith<$Res> {
  factory $StoriesImageCopyWith(
          StoriesImage value, $Res Function(StoriesImage) _then) =
      _$StoriesImageCopyWithImpl;
  @useResult
  $Res call({String name, String img, ImageSource source});
}

/// @nodoc
class _$StoriesImageCopyWithImpl<$Res> implements $StoriesImageCopyWith<$Res> {
  _$StoriesImageCopyWithImpl(this._self, this._then);

  final StoriesImage _self;
  final $Res Function(StoriesImage) _then;

  /// Create a copy of StoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? img = null,
    Object? source = null,
  }) {
    return _then(StoriesImage(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      img: null == img
          ? _self.img
          : img // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as ImageSource,
    ));
  }
}

/// @nodoc
mixin _$StoriesState {
  List<StoriesFetchModel> get storiesData;
  StoriesFetchModel get currentUserStoriesData;
  ProfileModel get profileData;

  /// Create a copy of StoriesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StoriesStateCopyWith<StoriesState> get copyWith =>
      _$StoriesStateCopyWithImpl<StoriesState>(
          this as StoriesState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StoriesState &&
            const DeepCollectionEquality()
                .equals(other.storiesData, storiesData) &&
            (identical(other.currentUserStoriesData, currentUserStoriesData) ||
                other.currentUserStoriesData == currentUserStoriesData) &&
            (identical(other.profileData, profileData) ||
                other.profileData == profileData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(storiesData),
      currentUserStoriesData,
      profileData);

  @override
  String toString() {
    return 'StoriesState(storiesData: $storiesData, currentUserStoriesData: $currentUserStoriesData, profileData: $profileData)';
  }
}

/// @nodoc
abstract mixin class $StoriesStateCopyWith<$Res> {
  factory $StoriesStateCopyWith(
          StoriesState value, $Res Function(StoriesState) _then) =
      _$StoriesStateCopyWithImpl;
  @useResult
  $Res call(
      {List<StoriesFetchModel> storiesData,
      StoriesFetchModel currentUserStoriesData,
      ProfileModel profileData});

  $StoriesFetchModelCopyWith<$Res> get currentUserStoriesData;
  $ProfileModelCopyWith<$Res> get profileData;
}

/// @nodoc
class _$StoriesStateCopyWithImpl<$Res> implements $StoriesStateCopyWith<$Res> {
  _$StoriesStateCopyWithImpl(this._self, this._then);

  final StoriesState _self;
  final $Res Function(StoriesState) _then;

  /// Create a copy of StoriesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storiesData = null,
    Object? currentUserStoriesData = null,
    Object? profileData = null,
  }) {
    return _then(_self.copyWith(
      storiesData: null == storiesData
          ? _self.storiesData
          : storiesData // ignore: cast_nullable_to_non_nullable
              as List<StoriesFetchModel>,
      currentUserStoriesData: null == currentUserStoriesData
          ? _self.currentUserStoriesData
          : currentUserStoriesData // ignore: cast_nullable_to_non_nullable
              as StoriesFetchModel,
      profileData: null == profileData
          ? _self.profileData
          : profileData // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
    ));
  }

  /// Create a copy of StoriesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StoriesFetchModelCopyWith<$Res> get currentUserStoriesData {
    return $StoriesFetchModelCopyWith<$Res>(_self.currentUserStoriesData,
        (value) {
      return _then(_self.copyWith(currentUserStoriesData: value));
    });
  }

  /// Create a copy of StoriesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileModelCopyWith<$Res> get profileData {
    return $ProfileModelCopyWith<$Res>(_self.profileData, (value) {
      return _then(_self.copyWith(profileData: value));
    });
  }
}

/// Adds pattern-matching-related methods to [StoriesState].
extension StoriesStatePatterns on StoriesState {
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
    TResult Function(StoriesLoaded value)? storiesLoaded,
    TResult Function(_Initial value)? initial,
    TResult Function(Posting value)? posting,
    TResult Function(Posted value)? posted,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case StoriesLoaded() when storiesLoaded != null:
        return storiesLoaded(_that);
      case _Initial() when initial != null:
        return initial(_that);
      case Posting() when posting != null:
        return posting(_that);
      case Posted() when posted != null:
        return posted(_that);
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
    required TResult Function(StoriesLoaded value) storiesLoaded,
    required TResult Function(_Initial value) initial,
    required TResult Function(Posting value) posting,
    required TResult Function(Posted value) posted,
  }) {
    final _that = this;
    switch (_that) {
      case StoriesLoaded():
        return storiesLoaded(_that);
      case _Initial():
        return initial(_that);
      case Posting():
        return posting(_that);
      case Posted():
        return posted(_that);
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
    TResult? Function(StoriesLoaded value)? storiesLoaded,
    TResult? Function(_Initial value)? initial,
    TResult? Function(Posting value)? posting,
    TResult? Function(Posted value)? posted,
  }) {
    final _that = this;
    switch (_that) {
      case StoriesLoaded() when storiesLoaded != null:
        return storiesLoaded(_that);
      case _Initial() when initial != null:
        return initial(_that);
      case Posting() when posting != null:
        return posting(_that);
      case Posted() when posted != null:
        return posted(_that);
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
    TResult Function(List<StoriesFetchModel> storiesData,
            StoriesFetchModel currentUserStoriesData, ProfileModel profileData)?
        storiesLoaded,
    TResult Function(List<StoriesFetchModel> storiesData,
            StoriesFetchModel currentUserStoriesData, ProfileModel profileData)?
        initial,
    TResult Function(List<StoriesFetchModel> storiesData,
            StoriesFetchModel currentUserStoriesData, ProfileModel profileData)?
        posting,
    TResult Function(List<StoriesFetchModel> storiesData,
            StoriesFetchModel currentUserStoriesData, ProfileModel profileData)?
        posted,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case StoriesLoaded() when storiesLoaded != null:
        return storiesLoaded(
            _that.storiesData, _that.currentUserStoriesData, _that.profileData);
      case _Initial() when initial != null:
        return initial(
            _that.storiesData, _that.currentUserStoriesData, _that.profileData);
      case Posting() when posting != null:
        return posting(
            _that.storiesData, _that.currentUserStoriesData, _that.profileData);
      case Posted() when posted != null:
        return posted(
            _that.storiesData, _that.currentUserStoriesData, _that.profileData);
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
    required TResult Function(List<StoriesFetchModel> storiesData,
            StoriesFetchModel currentUserStoriesData, ProfileModel profileData)
        storiesLoaded,
    required TResult Function(List<StoriesFetchModel> storiesData,
            StoriesFetchModel currentUserStoriesData, ProfileModel profileData)
        initial,
    required TResult Function(List<StoriesFetchModel> storiesData,
            StoriesFetchModel currentUserStoriesData, ProfileModel profileData)
        posting,
    required TResult Function(List<StoriesFetchModel> storiesData,
            StoriesFetchModel currentUserStoriesData, ProfileModel profileData)
        posted,
  }) {
    final _that = this;
    switch (_that) {
      case StoriesLoaded():
        return storiesLoaded(
            _that.storiesData, _that.currentUserStoriesData, _that.profileData);
      case _Initial():
        return initial(
            _that.storiesData, _that.currentUserStoriesData, _that.profileData);
      case Posting():
        return posting(
            _that.storiesData, _that.currentUserStoriesData, _that.profileData);
      case Posted():
        return posted(
            _that.storiesData, _that.currentUserStoriesData, _that.profileData);
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
    TResult? Function(List<StoriesFetchModel> storiesData,
            StoriesFetchModel currentUserStoriesData, ProfileModel profileData)?
        storiesLoaded,
    TResult? Function(List<StoriesFetchModel> storiesData,
            StoriesFetchModel currentUserStoriesData, ProfileModel profileData)?
        initial,
    TResult? Function(List<StoriesFetchModel> storiesData,
            StoriesFetchModel currentUserStoriesData, ProfileModel profileData)?
        posting,
    TResult? Function(List<StoriesFetchModel> storiesData,
            StoriesFetchModel currentUserStoriesData, ProfileModel profileData)?
        posted,
  }) {
    final _that = this;
    switch (_that) {
      case StoriesLoaded() when storiesLoaded != null:
        return storiesLoaded(
            _that.storiesData, _that.currentUserStoriesData, _that.profileData);
      case _Initial() when initial != null:
        return initial(
            _that.storiesData, _that.currentUserStoriesData, _that.profileData);
      case Posting() when posting != null:
        return posting(
            _that.storiesData, _that.currentUserStoriesData, _that.profileData);
      case Posted() when posted != null:
        return posted(
            _that.storiesData, _that.currentUserStoriesData, _that.profileData);
      case _:
        return null;
    }
  }
}

/// @nodoc

class StoriesLoaded implements StoriesState {
  const StoriesLoaded(
      {required final List<StoriesFetchModel> storiesData,
      required this.currentUserStoriesData,
      required this.profileData})
      : _storiesData = storiesData;

  final List<StoriesFetchModel> _storiesData;
  @override
  List<StoriesFetchModel> get storiesData {
    if (_storiesData is EqualUnmodifiableListView) return _storiesData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_storiesData);
  }

  @override
  final StoriesFetchModel currentUserStoriesData;
  @override
  final ProfileModel profileData;

  /// Create a copy of StoriesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StoriesLoadedCopyWith<StoriesLoaded> get copyWith =>
      _$StoriesLoadedCopyWithImpl<StoriesLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StoriesLoaded &&
            const DeepCollectionEquality()
                .equals(other._storiesData, _storiesData) &&
            (identical(other.currentUserStoriesData, currentUserStoriesData) ||
                other.currentUserStoriesData == currentUserStoriesData) &&
            (identical(other.profileData, profileData) ||
                other.profileData == profileData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_storiesData),
      currentUserStoriesData,
      profileData);

  @override
  String toString() {
    return 'StoriesState.storiesLoaded(storiesData: $storiesData, currentUserStoriesData: $currentUserStoriesData, profileData: $profileData)';
  }
}

/// @nodoc
abstract mixin class $StoriesLoadedCopyWith<$Res>
    implements $StoriesStateCopyWith<$Res> {
  factory $StoriesLoadedCopyWith(
          StoriesLoaded value, $Res Function(StoriesLoaded) _then) =
      _$StoriesLoadedCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<StoriesFetchModel> storiesData,
      StoriesFetchModel currentUserStoriesData,
      ProfileModel profileData});

  @override
  $StoriesFetchModelCopyWith<$Res> get currentUserStoriesData;
  @override
  $ProfileModelCopyWith<$Res> get profileData;
}

/// @nodoc
class _$StoriesLoadedCopyWithImpl<$Res>
    implements $StoriesLoadedCopyWith<$Res> {
  _$StoriesLoadedCopyWithImpl(this._self, this._then);

  final StoriesLoaded _self;
  final $Res Function(StoriesLoaded) _then;

  /// Create a copy of StoriesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? storiesData = null,
    Object? currentUserStoriesData = null,
    Object? profileData = null,
  }) {
    return _then(StoriesLoaded(
      storiesData: null == storiesData
          ? _self._storiesData
          : storiesData // ignore: cast_nullable_to_non_nullable
              as List<StoriesFetchModel>,
      currentUserStoriesData: null == currentUserStoriesData
          ? _self.currentUserStoriesData
          : currentUserStoriesData // ignore: cast_nullable_to_non_nullable
              as StoriesFetchModel,
      profileData: null == profileData
          ? _self.profileData
          : profileData // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
    ));
  }

  /// Create a copy of StoriesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StoriesFetchModelCopyWith<$Res> get currentUserStoriesData {
    return $StoriesFetchModelCopyWith<$Res>(_self.currentUserStoriesData,
        (value) {
      return _then(_self.copyWith(currentUserStoriesData: value));
    });
  }

  /// Create a copy of StoriesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileModelCopyWith<$Res> get profileData {
    return $ProfileModelCopyWith<$Res>(_self.profileData, (value) {
      return _then(_self.copyWith(profileData: value));
    });
  }
}

/// @nodoc

class _Initial implements StoriesState {
  const _Initial(
      {required final List<StoriesFetchModel> storiesData,
      required this.currentUserStoriesData,
      required this.profileData})
      : _storiesData = storiesData;

  final List<StoriesFetchModel> _storiesData;
  @override
  List<StoriesFetchModel> get storiesData {
    if (_storiesData is EqualUnmodifiableListView) return _storiesData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_storiesData);
  }

  @override
  final StoriesFetchModel currentUserStoriesData;
  @override
  final ProfileModel profileData;

  /// Create a copy of StoriesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Initial &&
            const DeepCollectionEquality()
                .equals(other._storiesData, _storiesData) &&
            (identical(other.currentUserStoriesData, currentUserStoriesData) ||
                other.currentUserStoriesData == currentUserStoriesData) &&
            (identical(other.profileData, profileData) ||
                other.profileData == profileData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_storiesData),
      currentUserStoriesData,
      profileData);

  @override
  String toString() {
    return 'StoriesState.initial(storiesData: $storiesData, currentUserStoriesData: $currentUserStoriesData, profileData: $profileData)';
  }
}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res>
    implements $StoriesStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) =
      __$InitialCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<StoriesFetchModel> storiesData,
      StoriesFetchModel currentUserStoriesData,
      ProfileModel profileData});

  @override
  $StoriesFetchModelCopyWith<$Res> get currentUserStoriesData;
  @override
  $ProfileModelCopyWith<$Res> get profileData;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

  /// Create a copy of StoriesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? storiesData = null,
    Object? currentUserStoriesData = null,
    Object? profileData = null,
  }) {
    return _then(_Initial(
      storiesData: null == storiesData
          ? _self._storiesData
          : storiesData // ignore: cast_nullable_to_non_nullable
              as List<StoriesFetchModel>,
      currentUserStoriesData: null == currentUserStoriesData
          ? _self.currentUserStoriesData
          : currentUserStoriesData // ignore: cast_nullable_to_non_nullable
              as StoriesFetchModel,
      profileData: null == profileData
          ? _self.profileData
          : profileData // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
    ));
  }

  /// Create a copy of StoriesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StoriesFetchModelCopyWith<$Res> get currentUserStoriesData {
    return $StoriesFetchModelCopyWith<$Res>(_self.currentUserStoriesData,
        (value) {
      return _then(_self.copyWith(currentUserStoriesData: value));
    });
  }

  /// Create a copy of StoriesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileModelCopyWith<$Res> get profileData {
    return $ProfileModelCopyWith<$Res>(_self.profileData, (value) {
      return _then(_self.copyWith(profileData: value));
    });
  }
}

/// @nodoc

class Posting implements StoriesState {
  const Posting(
      {required final List<StoriesFetchModel> storiesData,
      required this.currentUserStoriesData,
      required this.profileData})
      : _storiesData = storiesData;

  final List<StoriesFetchModel> _storiesData;
  @override
  List<StoriesFetchModel> get storiesData {
    if (_storiesData is EqualUnmodifiableListView) return _storiesData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_storiesData);
  }

  @override
  final StoriesFetchModel currentUserStoriesData;
  @override
  final ProfileModel profileData;

  /// Create a copy of StoriesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PostingCopyWith<Posting> get copyWith =>
      _$PostingCopyWithImpl<Posting>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Posting &&
            const DeepCollectionEquality()
                .equals(other._storiesData, _storiesData) &&
            (identical(other.currentUserStoriesData, currentUserStoriesData) ||
                other.currentUserStoriesData == currentUserStoriesData) &&
            (identical(other.profileData, profileData) ||
                other.profileData == profileData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_storiesData),
      currentUserStoriesData,
      profileData);

  @override
  String toString() {
    return 'StoriesState.posting(storiesData: $storiesData, currentUserStoriesData: $currentUserStoriesData, profileData: $profileData)';
  }
}

/// @nodoc
abstract mixin class $PostingCopyWith<$Res>
    implements $StoriesStateCopyWith<$Res> {
  factory $PostingCopyWith(Posting value, $Res Function(Posting) _then) =
      _$PostingCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<StoriesFetchModel> storiesData,
      StoriesFetchModel currentUserStoriesData,
      ProfileModel profileData});

  @override
  $StoriesFetchModelCopyWith<$Res> get currentUserStoriesData;
  @override
  $ProfileModelCopyWith<$Res> get profileData;
}

/// @nodoc
class _$PostingCopyWithImpl<$Res> implements $PostingCopyWith<$Res> {
  _$PostingCopyWithImpl(this._self, this._then);

  final Posting _self;
  final $Res Function(Posting) _then;

  /// Create a copy of StoriesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? storiesData = null,
    Object? currentUserStoriesData = null,
    Object? profileData = null,
  }) {
    return _then(Posting(
      storiesData: null == storiesData
          ? _self._storiesData
          : storiesData // ignore: cast_nullable_to_non_nullable
              as List<StoriesFetchModel>,
      currentUserStoriesData: null == currentUserStoriesData
          ? _self.currentUserStoriesData
          : currentUserStoriesData // ignore: cast_nullable_to_non_nullable
              as StoriesFetchModel,
      profileData: null == profileData
          ? _self.profileData
          : profileData // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
    ));
  }

  /// Create a copy of StoriesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StoriesFetchModelCopyWith<$Res> get currentUserStoriesData {
    return $StoriesFetchModelCopyWith<$Res>(_self.currentUserStoriesData,
        (value) {
      return _then(_self.copyWith(currentUserStoriesData: value));
    });
  }

  /// Create a copy of StoriesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileModelCopyWith<$Res> get profileData {
    return $ProfileModelCopyWith<$Res>(_self.profileData, (value) {
      return _then(_self.copyWith(profileData: value));
    });
  }
}

/// @nodoc

class Posted implements StoriesState {
  const Posted(
      {required final List<StoriesFetchModel> storiesData,
      required this.currentUserStoriesData,
      required this.profileData})
      : _storiesData = storiesData;

  final List<StoriesFetchModel> _storiesData;
  @override
  List<StoriesFetchModel> get storiesData {
    if (_storiesData is EqualUnmodifiableListView) return _storiesData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_storiesData);
  }

  @override
  final StoriesFetchModel currentUserStoriesData;
  @override
  final ProfileModel profileData;

  /// Create a copy of StoriesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PostedCopyWith<Posted> get copyWith =>
      _$PostedCopyWithImpl<Posted>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Posted &&
            const DeepCollectionEquality()
                .equals(other._storiesData, _storiesData) &&
            (identical(other.currentUserStoriesData, currentUserStoriesData) ||
                other.currentUserStoriesData == currentUserStoriesData) &&
            (identical(other.profileData, profileData) ||
                other.profileData == profileData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_storiesData),
      currentUserStoriesData,
      profileData);

  @override
  String toString() {
    return 'StoriesState.posted(storiesData: $storiesData, currentUserStoriesData: $currentUserStoriesData, profileData: $profileData)';
  }
}

/// @nodoc
abstract mixin class $PostedCopyWith<$Res>
    implements $StoriesStateCopyWith<$Res> {
  factory $PostedCopyWith(Posted value, $Res Function(Posted) _then) =
      _$PostedCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<StoriesFetchModel> storiesData,
      StoriesFetchModel currentUserStoriesData,
      ProfileModel profileData});

  @override
  $StoriesFetchModelCopyWith<$Res> get currentUserStoriesData;
  @override
  $ProfileModelCopyWith<$Res> get profileData;
}

/// @nodoc
class _$PostedCopyWithImpl<$Res> implements $PostedCopyWith<$Res> {
  _$PostedCopyWithImpl(this._self, this._then);

  final Posted _self;
  final $Res Function(Posted) _then;

  /// Create a copy of StoriesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? storiesData = null,
    Object? currentUserStoriesData = null,
    Object? profileData = null,
  }) {
    return _then(Posted(
      storiesData: null == storiesData
          ? _self._storiesData
          : storiesData // ignore: cast_nullable_to_non_nullable
              as List<StoriesFetchModel>,
      currentUserStoriesData: null == currentUserStoriesData
          ? _self.currentUserStoriesData
          : currentUserStoriesData // ignore: cast_nullable_to_non_nullable
              as StoriesFetchModel,
      profileData: null == profileData
          ? _self.profileData
          : profileData // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
    ));
  }

  /// Create a copy of StoriesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StoriesFetchModelCopyWith<$Res> get currentUserStoriesData {
    return $StoriesFetchModelCopyWith<$Res>(_self.currentUserStoriesData,
        (value) {
      return _then(_self.copyWith(currentUserStoriesData: value));
    });
  }

  /// Create a copy of StoriesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileModelCopyWith<$Res> get profileData {
    return $ProfileModelCopyWith<$Res>(_self.profileData, (value) {
      return _then(_self.copyWith(profileData: value));
    });
  }
}

// dart format on
