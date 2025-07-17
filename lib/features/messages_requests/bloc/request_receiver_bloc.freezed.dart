// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_receiver_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RequestReceiverEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RequestReceiverEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RequestReceiverEvent()';
  }
}

/// @nodoc
class $RequestReceiverEventCopyWith<$Res> {
  $RequestReceiverEventCopyWith(
      RequestReceiverEvent _, $Res Function(RequestReceiverEvent) __);
}

/// Adds pattern-matching-related methods to [RequestReceiverEvent].
extension RequestReceiverEventPatterns on RequestReceiverEvent {
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
    TResult Function(RequestReceiverGet value)? messagesRequestsGet,
    TResult Function(RequestReceiverUnreadCount value)?
        messagesRequestsUnreadCount,
    TResult Function(AcceptRequest value)? acceptRequest,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case RequestReceiverGet() when messagesRequestsGet != null:
        return messagesRequestsGet(_that);
      case RequestReceiverUnreadCount()
          when messagesRequestsUnreadCount != null:
        return messagesRequestsUnreadCount(_that);
      case AcceptRequest() when acceptRequest != null:
        return acceptRequest(_that);
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
    required TResult Function(RequestReceiverGet value) messagesRequestsGet,
    required TResult Function(RequestReceiverUnreadCount value)
        messagesRequestsUnreadCount,
    required TResult Function(AcceptRequest value) acceptRequest,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started(_that);
      case RequestReceiverGet():
        return messagesRequestsGet(_that);
      case RequestReceiverUnreadCount():
        return messagesRequestsUnreadCount(_that);
      case AcceptRequest():
        return acceptRequest(_that);
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
    TResult? Function(RequestReceiverGet value)? messagesRequestsGet,
    TResult? Function(RequestReceiverUnreadCount value)?
        messagesRequestsUnreadCount,
    TResult? Function(AcceptRequest value)? acceptRequest,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case RequestReceiverGet() when messagesRequestsGet != null:
        return messagesRequestsGet(_that);
      case RequestReceiverUnreadCount()
          when messagesRequestsUnreadCount != null:
        return messagesRequestsUnreadCount(_that);
      case AcceptRequest() when acceptRequest != null:
        return acceptRequest(_that);
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
    TResult Function()? messagesRequestsGet,
    TResult Function()? messagesRequestsUnreadCount,
    TResult Function(String senderId, String receiverId)? acceptRequest,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started();
      case RequestReceiverGet() when messagesRequestsGet != null:
        return messagesRequestsGet();
      case RequestReceiverUnreadCount()
          when messagesRequestsUnreadCount != null:
        return messagesRequestsUnreadCount();
      case AcceptRequest() when acceptRequest != null:
        return acceptRequest(_that.senderId, _that.receiverId);
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
    required TResult Function() messagesRequestsGet,
    required TResult Function() messagesRequestsUnreadCount,
    required TResult Function(String senderId, String receiverId) acceptRequest,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started();
      case RequestReceiverGet():
        return messagesRequestsGet();
      case RequestReceiverUnreadCount():
        return messagesRequestsUnreadCount();
      case AcceptRequest():
        return acceptRequest(_that.senderId, _that.receiverId);
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
    TResult? Function()? messagesRequestsGet,
    TResult? Function()? messagesRequestsUnreadCount,
    TResult? Function(String senderId, String receiverId)? acceptRequest,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started();
      case RequestReceiverGet() when messagesRequestsGet != null:
        return messagesRequestsGet();
      case RequestReceiverUnreadCount()
          when messagesRequestsUnreadCount != null:
        return messagesRequestsUnreadCount();
      case AcceptRequest() when acceptRequest != null:
        return acceptRequest(_that.senderId, _that.receiverId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Started implements RequestReceiverEvent {
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
    return 'RequestReceiverEvent.started()';
  }
}

/// @nodoc

class RequestReceiverGet implements RequestReceiverEvent {
  const RequestReceiverGet();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RequestReceiverGet);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RequestReceiverEvent.messagesRequestsGet()';
  }
}

/// @nodoc

class RequestReceiverUnreadCount implements RequestReceiverEvent {
  const RequestReceiverUnreadCount();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RequestReceiverUnreadCount);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RequestReceiverEvent.messagesRequestsUnreadCount()';
  }
}

/// @nodoc

class AcceptRequest implements RequestReceiverEvent {
  const AcceptRequest({required this.senderId, required this.receiverId});

  final String senderId;
  final String receiverId;

  /// Create a copy of RequestReceiverEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AcceptRequestCopyWith<AcceptRequest> get copyWith =>
      _$AcceptRequestCopyWithImpl<AcceptRequest>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AcceptRequest &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, senderId, receiverId);

  @override
  String toString() {
    return 'RequestReceiverEvent.acceptRequest(senderId: $senderId, receiverId: $receiverId)';
  }
}

/// @nodoc
abstract mixin class $AcceptRequestCopyWith<$Res>
    implements $RequestReceiverEventCopyWith<$Res> {
  factory $AcceptRequestCopyWith(
          AcceptRequest value, $Res Function(AcceptRequest) _then) =
      _$AcceptRequestCopyWithImpl;
  @useResult
  $Res call({String senderId, String receiverId});
}

/// @nodoc
class _$AcceptRequestCopyWithImpl<$Res>
    implements $AcceptRequestCopyWith<$Res> {
  _$AcceptRequestCopyWithImpl(this._self, this._then);

  final AcceptRequest _self;
  final $Res Function(AcceptRequest) _then;

  /// Create a copy of RequestReceiverEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? senderId = null,
    Object? receiverId = null,
  }) {
    return _then(AcceptRequest(
      senderId: null == senderId
          ? _self.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _self.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$RequestReceiverState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RequestReceiverState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RequestReceiverState()';
  }
}

/// @nodoc
class $RequestReceiverStateCopyWith<$Res> {
  $RequestReceiverStateCopyWith(
      RequestReceiverState _, $Res Function(RequestReceiverState) __);
}

/// Adds pattern-matching-related methods to [RequestReceiverState].
extension RequestReceiverStatePatterns on RequestReceiverState {
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
    TResult Function(NoRequestsYet value)? noRequestsYet,
    TResult Function(GetRequests value)? getRequests,
    TResult Function(GetUnreadCount value)? getUnreadCount,
    TResult Function(ErrorInRequests value)? errorInRequests,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case NoRequestsYet() when noRequestsYet != null:
        return noRequestsYet(_that);
      case GetRequests() when getRequests != null:
        return getRequests(_that);
      case GetUnreadCount() when getUnreadCount != null:
        return getUnreadCount(_that);
      case ErrorInRequests() when errorInRequests != null:
        return errorInRequests(_that);
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
    required TResult Function(NoRequestsYet value) noRequestsYet,
    required TResult Function(GetRequests value) getRequests,
    required TResult Function(GetUnreadCount value) getUnreadCount,
    required TResult Function(ErrorInRequests value) errorInRequests,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case NoRequestsYet():
        return noRequestsYet(_that);
      case GetRequests():
        return getRequests(_that);
      case GetUnreadCount():
        return getUnreadCount(_that);
      case ErrorInRequests():
        return errorInRequests(_that);
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
    TResult? Function(NoRequestsYet value)? noRequestsYet,
    TResult? Function(GetRequests value)? getRequests,
    TResult? Function(GetUnreadCount value)? getUnreadCount,
    TResult? Function(ErrorInRequests value)? errorInRequests,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case NoRequestsYet() when noRequestsYet != null:
        return noRequestsYet(_that);
      case GetRequests() when getRequests != null:
        return getRequests(_that);
      case GetUnreadCount() when getUnreadCount != null:
        return getUnreadCount(_that);
      case ErrorInRequests() when errorInRequests != null:
        return errorInRequests(_that);
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
    TResult Function()? noRequestsYet,
    TResult Function(List<Requestmodel> receiverData)? getRequests,
    TResult Function(int count)? getUnreadCount,
    TResult Function(String errorMessage)? errorInRequests,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case NoRequestsYet() when noRequestsYet != null:
        return noRequestsYet();
      case GetRequests() when getRequests != null:
        return getRequests(_that.receiverData);
      case GetUnreadCount() when getUnreadCount != null:
        return getUnreadCount(_that.count);
      case ErrorInRequests() when errorInRequests != null:
        return errorInRequests(_that.errorMessage);
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
    required TResult Function() noRequestsYet,
    required TResult Function(List<Requestmodel> receiverData) getRequests,
    required TResult Function(int count) getUnreadCount,
    required TResult Function(String errorMessage) errorInRequests,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case NoRequestsYet():
        return noRequestsYet();
      case GetRequests():
        return getRequests(_that.receiverData);
      case GetUnreadCount():
        return getUnreadCount(_that.count);
      case ErrorInRequests():
        return errorInRequests(_that.errorMessage);
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
    TResult? Function()? noRequestsYet,
    TResult? Function(List<Requestmodel> receiverData)? getRequests,
    TResult? Function(int count)? getUnreadCount,
    TResult? Function(String errorMessage)? errorInRequests,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case NoRequestsYet() when noRequestsYet != null:
        return noRequestsYet();
      case GetRequests() when getRequests != null:
        return getRequests(_that.receiverData);
      case GetUnreadCount() when getUnreadCount != null:
        return getUnreadCount(_that.count);
      case ErrorInRequests() when errorInRequests != null:
        return errorInRequests(_that.errorMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements RequestReceiverState {
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
    return 'RequestReceiverState.initial()';
  }
}

/// @nodoc

class NoRequestsYet implements RequestReceiverState {
  const NoRequestsYet();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NoRequestsYet);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RequestReceiverState.noRequestsYet()';
  }
}

/// @nodoc

class GetRequests implements RequestReceiverState {
  const GetRequests({required final List<Requestmodel> receiverData})
      : _receiverData = receiverData;

  final List<Requestmodel> _receiverData;
  List<Requestmodel> get receiverData {
    if (_receiverData is EqualUnmodifiableListView) return _receiverData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_receiverData);
  }

  /// Create a copy of RequestReceiverState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetRequestsCopyWith<GetRequests> get copyWith =>
      _$GetRequestsCopyWithImpl<GetRequests>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetRequests &&
            const DeepCollectionEquality()
                .equals(other._receiverData, _receiverData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_receiverData));

  @override
  String toString() {
    return 'RequestReceiverState.getRequests(receiverData: $receiverData)';
  }
}

/// @nodoc
abstract mixin class $GetRequestsCopyWith<$Res>
    implements $RequestReceiverStateCopyWith<$Res> {
  factory $GetRequestsCopyWith(
          GetRequests value, $Res Function(GetRequests) _then) =
      _$GetRequestsCopyWithImpl;
  @useResult
  $Res call({List<Requestmodel> receiverData});
}

/// @nodoc
class _$GetRequestsCopyWithImpl<$Res> implements $GetRequestsCopyWith<$Res> {
  _$GetRequestsCopyWithImpl(this._self, this._then);

  final GetRequests _self;
  final $Res Function(GetRequests) _then;

  /// Create a copy of RequestReceiverState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? receiverData = null,
  }) {
    return _then(GetRequests(
      receiverData: null == receiverData
          ? _self._receiverData
          : receiverData // ignore: cast_nullable_to_non_nullable
              as List<Requestmodel>,
    ));
  }
}

/// @nodoc

class GetUnreadCount implements RequestReceiverState {
  const GetUnreadCount({required this.count});

  final int count;

  /// Create a copy of RequestReceiverState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetUnreadCountCopyWith<GetUnreadCount> get copyWith =>
      _$GetUnreadCountCopyWithImpl<GetUnreadCount>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetUnreadCount &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(runtimeType, count);

  @override
  String toString() {
    return 'RequestReceiverState.getUnreadCount(count: $count)';
  }
}

/// @nodoc
abstract mixin class $GetUnreadCountCopyWith<$Res>
    implements $RequestReceiverStateCopyWith<$Res> {
  factory $GetUnreadCountCopyWith(
          GetUnreadCount value, $Res Function(GetUnreadCount) _then) =
      _$GetUnreadCountCopyWithImpl;
  @useResult
  $Res call({int count});
}

/// @nodoc
class _$GetUnreadCountCopyWithImpl<$Res>
    implements $GetUnreadCountCopyWith<$Res> {
  _$GetUnreadCountCopyWithImpl(this._self, this._then);

  final GetUnreadCount _self;
  final $Res Function(GetUnreadCount) _then;

  /// Create a copy of RequestReceiverState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? count = null,
  }) {
    return _then(GetUnreadCount(
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class ErrorInRequests implements RequestReceiverState {
  const ErrorInRequests({required this.errorMessage});

  final String errorMessage;

  /// Create a copy of RequestReceiverState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErrorInRequestsCopyWith<ErrorInRequests> get copyWith =>
      _$ErrorInRequestsCopyWithImpl<ErrorInRequests>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorInRequests &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @override
  String toString() {
    return 'RequestReceiverState.errorInRequests(errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $ErrorInRequestsCopyWith<$Res>
    implements $RequestReceiverStateCopyWith<$Res> {
  factory $ErrorInRequestsCopyWith(
          ErrorInRequests value, $Res Function(ErrorInRequests) _then) =
      _$ErrorInRequestsCopyWithImpl;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class _$ErrorInRequestsCopyWithImpl<$Res>
    implements $ErrorInRequestsCopyWith<$Res> {
  _$ErrorInRequestsCopyWithImpl(this._self, this._then);

  final ErrorInRequests _self;
  final $Res Function(ErrorInRequests) _then;

  /// Create a copy of RequestReceiverState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(ErrorInRequests(
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
