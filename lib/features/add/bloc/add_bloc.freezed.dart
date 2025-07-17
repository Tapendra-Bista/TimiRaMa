// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AddEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddEvent()';
  }
}

/// @nodoc
class $AddEventCopyWith<$Res> {
  $AddEventCopyWith(AddEvent _, $Res Function(AddEvent) __);
}

/// Adds pattern-matching-related methods to [AddEvent].
extension AddEventPatterns on AddEvent {
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
    TResult Function(PickVideo value)? pickVideo,
    TResult Function(RecordVideo value)? recordVideo,
    TResult Function(PostReel value)? post,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case PickVideo() when pickVideo != null:
        return pickVideo(_that);
      case RecordVideo() when recordVideo != null:
        return recordVideo(_that);
      case PostReel() when post != null:
        return post(_that);
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
    required TResult Function(PickVideo value) pickVideo,
    required TResult Function(RecordVideo value) recordVideo,
    required TResult Function(PostReel value) post,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started(_that);
      case PickVideo():
        return pickVideo(_that);
      case RecordVideo():
        return recordVideo(_that);
      case PostReel():
        return post(_that);
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
    TResult? Function(PickVideo value)? pickVideo,
    TResult? Function(RecordVideo value)? recordVideo,
    TResult? Function(PostReel value)? post,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case PickVideo() when pickVideo != null:
        return pickVideo(_that);
      case RecordVideo() when recordVideo != null:
        return recordVideo(_that);
      case PostReel() when post != null:
        return post(_that);
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
    TResult Function()? pickVideo,
    TResult Function(String videoPath)? recordVideo,
    TResult Function(String trimVideoUrl, String description)? post,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started();
      case PickVideo() when pickVideo != null:
        return pickVideo();
      case RecordVideo() when recordVideo != null:
        return recordVideo(_that.videoPath);
      case PostReel() when post != null:
        return post(_that.trimVideoUrl, _that.description);
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
    required TResult Function() pickVideo,
    required TResult Function(String videoPath) recordVideo,
    required TResult Function(String trimVideoUrl, String description) post,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started();
      case PickVideo():
        return pickVideo();
      case RecordVideo():
        return recordVideo(_that.videoPath);
      case PostReel():
        return post(_that.trimVideoUrl, _that.description);
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
    TResult? Function()? pickVideo,
    TResult? Function(String videoPath)? recordVideo,
    TResult? Function(String trimVideoUrl, String description)? post,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started();
      case PickVideo() when pickVideo != null:
        return pickVideo();
      case RecordVideo() when recordVideo != null:
        return recordVideo(_that.videoPath);
      case PostReel() when post != null:
        return post(_that.trimVideoUrl, _that.description);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Started implements AddEvent {
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
    return 'AddEvent.started()';
  }
}

/// @nodoc

class PickVideo implements AddEvent {
  const PickVideo();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PickVideo);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddEvent.pickVideo()';
  }
}

/// @nodoc

class RecordVideo implements AddEvent {
  const RecordVideo({required this.videoPath});

  final String videoPath;

  /// Create a copy of AddEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RecordVideoCopyWith<RecordVideo> get copyWith =>
      _$RecordVideoCopyWithImpl<RecordVideo>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RecordVideo &&
            (identical(other.videoPath, videoPath) ||
                other.videoPath == videoPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, videoPath);

  @override
  String toString() {
    return 'AddEvent.recordVideo(videoPath: $videoPath)';
  }
}

/// @nodoc
abstract mixin class $RecordVideoCopyWith<$Res>
    implements $AddEventCopyWith<$Res> {
  factory $RecordVideoCopyWith(
          RecordVideo value, $Res Function(RecordVideo) _then) =
      _$RecordVideoCopyWithImpl;
  @useResult
  $Res call({String videoPath});
}

/// @nodoc
class _$RecordVideoCopyWithImpl<$Res> implements $RecordVideoCopyWith<$Res> {
  _$RecordVideoCopyWithImpl(this._self, this._then);

  final RecordVideo _self;
  final $Res Function(RecordVideo) _then;

  /// Create a copy of AddEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? videoPath = null,
  }) {
    return _then(RecordVideo(
      videoPath: null == videoPath
          ? _self.videoPath
          : videoPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class PostReel implements AddEvent {
  const PostReel({required this.trimVideoUrl, required this.description});

  final String trimVideoUrl;
  final String description;

  /// Create a copy of AddEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PostReelCopyWith<PostReel> get copyWith =>
      _$PostReelCopyWithImpl<PostReel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PostReel &&
            (identical(other.trimVideoUrl, trimVideoUrl) ||
                other.trimVideoUrl == trimVideoUrl) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, trimVideoUrl, description);

  @override
  String toString() {
    return 'AddEvent.post(trimVideoUrl: $trimVideoUrl, description: $description)';
  }
}

/// @nodoc
abstract mixin class $PostReelCopyWith<$Res>
    implements $AddEventCopyWith<$Res> {
  factory $PostReelCopyWith(PostReel value, $Res Function(PostReel) _then) =
      _$PostReelCopyWithImpl;
  @useResult
  $Res call({String trimVideoUrl, String description});
}

/// @nodoc
class _$PostReelCopyWithImpl<$Res> implements $PostReelCopyWith<$Res> {
  _$PostReelCopyWithImpl(this._self, this._then);

  final PostReel _self;
  final $Res Function(PostReel) _then;

  /// Create a copy of AddEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? trimVideoUrl = null,
    Object? description = null,
  }) {
    return _then(PostReel(
      trimVideoUrl: null == trimVideoUrl
          ? _self.trimVideoUrl
          : trimVideoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$AddState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AddState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddState()';
  }
}

/// @nodoc
class $AddStateCopyWith<$Res> {
  $AddStateCopyWith(AddState _, $Res Function(AddState) __);
}

/// Adds pattern-matching-related methods to [AddState].
extension AddStatePatterns on AddState {
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
    TResult Function(_AddState value)? $default, {
    TResult Function(AddReelLoading value)? loading,
    TResult Function(AddReelSuccess value)? success,
    TResult Function(PostingError value)? error,
    TResult Function(ValidUrl value)? validUrl,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddState() when $default != null:
        return $default(_that);
      case AddReelLoading() when loading != null:
        return loading(_that);
      case AddReelSuccess() when success != null:
        return success(_that);
      case PostingError() when error != null:
        return error(_that);
      case ValidUrl() when validUrl != null:
        return validUrl(_that);
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
    TResult Function(_AddState value) $default, {
    required TResult Function(AddReelLoading value) loading,
    required TResult Function(AddReelSuccess value) success,
    required TResult Function(PostingError value) error,
    required TResult Function(ValidUrl value) validUrl,
  }) {
    final _that = this;
    switch (_that) {
      case _AddState():
        return $default(_that);
      case AddReelLoading():
        return loading(_that);
      case AddReelSuccess():
        return success(_that);
      case PostingError():
        return error(_that);
      case ValidUrl():
        return validUrl(_that);
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
    TResult? Function(_AddState value)? $default, {
    TResult? Function(AddReelLoading value)? loading,
    TResult? Function(AddReelSuccess value)? success,
    TResult? Function(PostingError value)? error,
    TResult? Function(ValidUrl value)? validUrl,
  }) {
    final _that = this;
    switch (_that) {
      case _AddState() when $default != null:
        return $default(_that);
      case AddReelLoading() when loading != null:
        return loading(_that);
      case AddReelSuccess() when success != null:
        return success(_that);
      case PostingError() when error != null:
        return error(_that);
      case ValidUrl() when validUrl != null:
        return validUrl(_that);
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
    TResult Function()? $default, {
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorMessage)? error,
    TResult Function(String videoUrl)? validUrl,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddState() when $default != null:
        return $default();
      case AddReelLoading() when loading != null:
        return loading();
      case AddReelSuccess() when success != null:
        return success();
      case PostingError() when error != null:
        return error(_that.errorMessage);
      case ValidUrl() when validUrl != null:
        return validUrl(_that.videoUrl);
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
    TResult Function() $default, {
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String errorMessage) error,
    required TResult Function(String videoUrl) validUrl,
  }) {
    final _that = this;
    switch (_that) {
      case _AddState():
        return $default();
      case AddReelLoading():
        return loading();
      case AddReelSuccess():
        return success();
      case PostingError():
        return error(_that.errorMessage);
      case ValidUrl():
        return validUrl(_that.videoUrl);
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
    TResult? Function()? $default, {
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String errorMessage)? error,
    TResult? Function(String videoUrl)? validUrl,
  }) {
    final _that = this;
    switch (_that) {
      case _AddState() when $default != null:
        return $default();
      case AddReelLoading() when loading != null:
        return loading();
      case AddReelSuccess() when success != null:
        return success();
      case PostingError() when error != null:
        return error(_that.errorMessage);
      case ValidUrl() when validUrl != null:
        return validUrl(_that.videoUrl);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AddState implements AddState {
  const _AddState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _AddState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddState()';
  }
}

/// @nodoc

class AddReelLoading implements AddState {
  const AddReelLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AddReelLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddState.loading()';
  }
}

/// @nodoc

class AddReelSuccess implements AddState {
  const AddReelSuccess();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AddReelSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddState.success()';
  }
}

/// @nodoc

class PostingError implements AddState {
  const PostingError({required this.errorMessage});

  final String errorMessage;

  /// Create a copy of AddState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PostingErrorCopyWith<PostingError> get copyWith =>
      _$PostingErrorCopyWithImpl<PostingError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PostingError &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @override
  String toString() {
    return 'AddState.error(errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $PostingErrorCopyWith<$Res>
    implements $AddStateCopyWith<$Res> {
  factory $PostingErrorCopyWith(
          PostingError value, $Res Function(PostingError) _then) =
      _$PostingErrorCopyWithImpl;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class _$PostingErrorCopyWithImpl<$Res> implements $PostingErrorCopyWith<$Res> {
  _$PostingErrorCopyWithImpl(this._self, this._then);

  final PostingError _self;
  final $Res Function(PostingError) _then;

  /// Create a copy of AddState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(PostingError(
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ValidUrl implements AddState {
  const ValidUrl({this.videoUrl = ''});

  @JsonKey()
  final String videoUrl;

  /// Create a copy of AddState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ValidUrlCopyWith<ValidUrl> get copyWith =>
      _$ValidUrlCopyWithImpl<ValidUrl>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ValidUrl &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, videoUrl);

  @override
  String toString() {
    return 'AddState.validUrl(videoUrl: $videoUrl)';
  }
}

/// @nodoc
abstract mixin class $ValidUrlCopyWith<$Res>
    implements $AddStateCopyWith<$Res> {
  factory $ValidUrlCopyWith(ValidUrl value, $Res Function(ValidUrl) _then) =
      _$ValidUrlCopyWithImpl;
  @useResult
  $Res call({String videoUrl});
}

/// @nodoc
class _$ValidUrlCopyWithImpl<$Res> implements $ValidUrlCopyWith<$Res> {
  _$ValidUrlCopyWithImpl(this._self, this._then);

  final ValidUrl _self;
  final $Res Function(ValidUrl) _then;

  /// Create a copy of AddState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? videoUrl = null,
  }) {
    return _then(ValidUrl(
      videoUrl: null == videoUrl
          ? _self.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
