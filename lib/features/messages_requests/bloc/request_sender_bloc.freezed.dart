// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_sender_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RequestSenderEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RequestSenderEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RequestSenderEvent()';
  }
}

/// @nodoc
class $RequestSenderEventCopyWith<$Res> {
  $RequestSenderEventCopyWith(
      RequestSenderEvent _, $Res Function(RequestSenderEvent) __);
}

/// Adds pattern-matching-related methods to [RequestSenderEvent].
extension RequestSenderEventPatterns on RequestSenderEvent {
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
    TResult Function(RequestSenderSend value)? messagesRequestsSend,
    TResult Function(TotalRequestSenderSend value)? totalRequestSenderSend,
    TResult Function(RequestSenderDelete value)? messagesRequestsDelete,
    TResult Function(CheckingUserAvailableEvent value)?
        checkingUserAvailableEvent,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case RequestSenderSend() when messagesRequestsSend != null:
        return messagesRequestsSend(_that);
      case TotalRequestSenderSend() when totalRequestSenderSend != null:
        return totalRequestSenderSend(_that);
      case RequestSenderDelete() when messagesRequestsDelete != null:
        return messagesRequestsDelete(_that);
      case CheckingUserAvailableEvent() when checkingUserAvailableEvent != null:
        return checkingUserAvailableEvent(_that);
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
    required TResult Function(RequestSenderSend value) messagesRequestsSend,
    required TResult Function(TotalRequestSenderSend value)
        totalRequestSenderSend,
    required TResult Function(RequestSenderDelete value) messagesRequestsDelete,
    required TResult Function(CheckingUserAvailableEvent value)
        checkingUserAvailableEvent,
  }) {
    final _that = this;
    switch (_that) {
      case RequestSenderSend():
        return messagesRequestsSend(_that);
      case TotalRequestSenderSend():
        return totalRequestSenderSend(_that);
      case RequestSenderDelete():
        return messagesRequestsDelete(_that);
      case CheckingUserAvailableEvent():
        return checkingUserAvailableEvent(_that);
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
    TResult? Function(RequestSenderSend value)? messagesRequestsSend,
    TResult? Function(TotalRequestSenderSend value)? totalRequestSenderSend,
    TResult? Function(RequestSenderDelete value)? messagesRequestsDelete,
    TResult? Function(CheckingUserAvailableEvent value)?
        checkingUserAvailableEvent,
  }) {
    final _that = this;
    switch (_that) {
      case RequestSenderSend() when messagesRequestsSend != null:
        return messagesRequestsSend(_that);
      case TotalRequestSenderSend() when totalRequestSenderSend != null:
        return totalRequestSenderSend(_that);
      case RequestSenderDelete() when messagesRequestsDelete != null:
        return messagesRequestsDelete(_that);
      case CheckingUserAvailableEvent() when checkingUserAvailableEvent != null:
        return checkingUserAvailableEvent(_that);
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
    TResult Function(String senderProfile, String senderName, String senderId,
            String receiverId, String receiverProfile, String receiverName)?
        messagesRequestsSend,
    TResult Function()? totalRequestSenderSend,
    TResult Function(String senderId, String receiverId)?
        messagesRequestsDelete,
    TResult Function(String senderId, String receiverId)?
        checkingUserAvailableEvent,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case RequestSenderSend() when messagesRequestsSend != null:
        return messagesRequestsSend(
            _that.senderProfile,
            _that.senderName,
            _that.senderId,
            _that.receiverId,
            _that.receiverProfile,
            _that.receiverName);
      case TotalRequestSenderSend() when totalRequestSenderSend != null:
        return totalRequestSenderSend();
      case RequestSenderDelete() when messagesRequestsDelete != null:
        return messagesRequestsDelete(_that.senderId, _that.receiverId);
      case CheckingUserAvailableEvent() when checkingUserAvailableEvent != null:
        return checkingUserAvailableEvent(_that.senderId, _that.receiverId);
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
            String senderProfile,
            String senderName,
            String senderId,
            String receiverId,
            String receiverProfile,
            String receiverName)
        messagesRequestsSend,
    required TResult Function() totalRequestSenderSend,
    required TResult Function(String senderId, String receiverId)
        messagesRequestsDelete,
    required TResult Function(String senderId, String receiverId)
        checkingUserAvailableEvent,
  }) {
    final _that = this;
    switch (_that) {
      case RequestSenderSend():
        return messagesRequestsSend(
            _that.senderProfile,
            _that.senderName,
            _that.senderId,
            _that.receiverId,
            _that.receiverProfile,
            _that.receiverName);
      case TotalRequestSenderSend():
        return totalRequestSenderSend();
      case RequestSenderDelete():
        return messagesRequestsDelete(_that.senderId, _that.receiverId);
      case CheckingUserAvailableEvent():
        return checkingUserAvailableEvent(_that.senderId, _that.receiverId);
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
    TResult? Function(String senderProfile, String senderName, String senderId,
            String receiverId, String receiverProfile, String receiverName)?
        messagesRequestsSend,
    TResult? Function()? totalRequestSenderSend,
    TResult? Function(String senderId, String receiverId)?
        messagesRequestsDelete,
    TResult? Function(String senderId, String receiverId)?
        checkingUserAvailableEvent,
  }) {
    final _that = this;
    switch (_that) {
      case RequestSenderSend() when messagesRequestsSend != null:
        return messagesRequestsSend(
            _that.senderProfile,
            _that.senderName,
            _that.senderId,
            _that.receiverId,
            _that.receiverProfile,
            _that.receiverName);
      case TotalRequestSenderSend() when totalRequestSenderSend != null:
        return totalRequestSenderSend();
      case RequestSenderDelete() when messagesRequestsDelete != null:
        return messagesRequestsDelete(_that.senderId, _that.receiverId);
      case CheckingUserAvailableEvent() when checkingUserAvailableEvent != null:
        return checkingUserAvailableEvent(_that.senderId, _that.receiverId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class RequestSenderSend implements RequestSenderEvent {
  const RequestSenderSend(
      {required this.senderProfile,
      required this.senderName,
      required this.senderId,
      required this.receiverId,
      required this.receiverProfile,
      required this.receiverName});

  final String senderProfile;
  final String senderName;
  final String senderId;
  final String receiverId;
  final String receiverProfile;
  final String receiverName;

  /// Create a copy of RequestSenderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RequestSenderSendCopyWith<RequestSenderSend> get copyWith =>
      _$RequestSenderSendCopyWithImpl<RequestSenderSend>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RequestSenderSend &&
            (identical(other.senderProfile, senderProfile) ||
                other.senderProfile == senderProfile) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.receiverProfile, receiverProfile) ||
                other.receiverProfile == receiverProfile) &&
            (identical(other.receiverName, receiverName) ||
                other.receiverName == receiverName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, senderProfile, senderName,
      senderId, receiverId, receiverProfile, receiverName);

  @override
  String toString() {
    return 'RequestSenderEvent.messagesRequestsSend(senderProfile: $senderProfile, senderName: $senderName, senderId: $senderId, receiverId: $receiverId, receiverProfile: $receiverProfile, receiverName: $receiverName)';
  }
}

/// @nodoc
abstract mixin class $RequestSenderSendCopyWith<$Res>
    implements $RequestSenderEventCopyWith<$Res> {
  factory $RequestSenderSendCopyWith(
          RequestSenderSend value, $Res Function(RequestSenderSend) _then) =
      _$RequestSenderSendCopyWithImpl;
  @useResult
  $Res call(
      {String senderProfile,
      String senderName,
      String senderId,
      String receiverId,
      String receiverProfile,
      String receiverName});
}

/// @nodoc
class _$RequestSenderSendCopyWithImpl<$Res>
    implements $RequestSenderSendCopyWith<$Res> {
  _$RequestSenderSendCopyWithImpl(this._self, this._then);

  final RequestSenderSend _self;
  final $Res Function(RequestSenderSend) _then;

  /// Create a copy of RequestSenderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? senderProfile = null,
    Object? senderName = null,
    Object? senderId = null,
    Object? receiverId = null,
    Object? receiverProfile = null,
    Object? receiverName = null,
  }) {
    return _then(RequestSenderSend(
      senderProfile: null == senderProfile
          ? _self.senderProfile
          : senderProfile // ignore: cast_nullable_to_non_nullable
              as String,
      senderName: null == senderName
          ? _self.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _self.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _self.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverProfile: null == receiverProfile
          ? _self.receiverProfile
          : receiverProfile // ignore: cast_nullable_to_non_nullable
              as String,
      receiverName: null == receiverName
          ? _self.receiverName
          : receiverName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class TotalRequestSenderSend implements RequestSenderEvent {
  const TotalRequestSenderSend();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TotalRequestSenderSend);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RequestSenderEvent.totalRequestSenderSend()';
  }
}

/// @nodoc

class RequestSenderDelete implements RequestSenderEvent {
  const RequestSenderDelete({required this.senderId, required this.receiverId});

  final String senderId;
  final String receiverId;

  /// Create a copy of RequestSenderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RequestSenderDeleteCopyWith<RequestSenderDelete> get copyWith =>
      _$RequestSenderDeleteCopyWithImpl<RequestSenderDelete>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RequestSenderDelete &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, senderId, receiverId);

  @override
  String toString() {
    return 'RequestSenderEvent.messagesRequestsDelete(senderId: $senderId, receiverId: $receiverId)';
  }
}

/// @nodoc
abstract mixin class $RequestSenderDeleteCopyWith<$Res>
    implements $RequestSenderEventCopyWith<$Res> {
  factory $RequestSenderDeleteCopyWith(
          RequestSenderDelete value, $Res Function(RequestSenderDelete) _then) =
      _$RequestSenderDeleteCopyWithImpl;
  @useResult
  $Res call({String senderId, String receiverId});
}

/// @nodoc
class _$RequestSenderDeleteCopyWithImpl<$Res>
    implements $RequestSenderDeleteCopyWith<$Res> {
  _$RequestSenderDeleteCopyWithImpl(this._self, this._then);

  final RequestSenderDelete _self;
  final $Res Function(RequestSenderDelete) _then;

  /// Create a copy of RequestSenderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? senderId = null,
    Object? receiverId = null,
  }) {
    return _then(RequestSenderDelete(
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

class CheckingUserAvailableEvent implements RequestSenderEvent {
  const CheckingUserAvailableEvent(
      {required this.senderId, required this.receiverId});

  final String senderId;
  final String receiverId;

  /// Create a copy of RequestSenderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CheckingUserAvailableEventCopyWith<CheckingUserAvailableEvent>
      get copyWith =>
          _$CheckingUserAvailableEventCopyWithImpl<CheckingUserAvailableEvent>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CheckingUserAvailableEvent &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, senderId, receiverId);

  @override
  String toString() {
    return 'RequestSenderEvent.checkingUserAvailableEvent(senderId: $senderId, receiverId: $receiverId)';
  }
}

/// @nodoc
abstract mixin class $CheckingUserAvailableEventCopyWith<$Res>
    implements $RequestSenderEventCopyWith<$Res> {
  factory $CheckingUserAvailableEventCopyWith(CheckingUserAvailableEvent value,
          $Res Function(CheckingUserAvailableEvent) _then) =
      _$CheckingUserAvailableEventCopyWithImpl;
  @useResult
  $Res call({String senderId, String receiverId});
}

/// @nodoc
class _$CheckingUserAvailableEventCopyWithImpl<$Res>
    implements $CheckingUserAvailableEventCopyWith<$Res> {
  _$CheckingUserAvailableEventCopyWithImpl(this._self, this._then);

  final CheckingUserAvailableEvent _self;
  final $Res Function(CheckingUserAvailableEvent) _then;

  /// Create a copy of RequestSenderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? senderId = null,
    Object? receiverId = null,
  }) {
    return _then(CheckingUserAvailableEvent(
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
mixin _$RequestSenderState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RequestSenderState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RequestSenderState()';
  }
}

/// @nodoc
class $RequestSenderStateCopyWith<$Res> {
  $RequestSenderStateCopyWith(
      RequestSenderState _, $Res Function(RequestSenderState) __);
}

/// Adds pattern-matching-related methods to [RequestSenderState].
extension RequestSenderStatePatterns on RequestSenderState {
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
    TResult Function(NoRequestsYet value)? noRequestsYet,
    TResult Function(TotalRequestSenderSendState value)?
        totalRequestSenderSendState,
    TResult Function(ErrorInRequests value)? errorInRequests,
    TResult Function(RequestsLoading value)? requestLoading,
    TResult Function(RequestSendSuccessfully value)? requestSendSuccessfully,
    TResult Function(CheckingUserAvailableState value)?
        checkingUserAvailableState,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case Initial() when initial != null:
        return initial(_that);
      case NoRequestsYet() when noRequestsYet != null:
        return noRequestsYet(_that);
      case TotalRequestSenderSendState()
          when totalRequestSenderSendState != null:
        return totalRequestSenderSendState(_that);
      case ErrorInRequests() when errorInRequests != null:
        return errorInRequests(_that);
      case RequestsLoading() when requestLoading != null:
        return requestLoading(_that);
      case RequestSendSuccessfully() when requestSendSuccessfully != null:
        return requestSendSuccessfully(_that);
      case CheckingUserAvailableState() when checkingUserAvailableState != null:
        return checkingUserAvailableState(_that);
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
    required TResult Function(NoRequestsYet value) noRequestsYet,
    required TResult Function(TotalRequestSenderSendState value)
        totalRequestSenderSendState,
    required TResult Function(ErrorInRequests value) errorInRequests,
    required TResult Function(RequestsLoading value) requestLoading,
    required TResult Function(RequestSendSuccessfully value)
        requestSendSuccessfully,
    required TResult Function(CheckingUserAvailableState value)
        checkingUserAvailableState,
  }) {
    final _that = this;
    switch (_that) {
      case Initial():
        return initial(_that);
      case NoRequestsYet():
        return noRequestsYet(_that);
      case TotalRequestSenderSendState():
        return totalRequestSenderSendState(_that);
      case ErrorInRequests():
        return errorInRequests(_that);
      case RequestsLoading():
        return requestLoading(_that);
      case RequestSendSuccessfully():
        return requestSendSuccessfully(_that);
      case CheckingUserAvailableState():
        return checkingUserAvailableState(_that);
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
    TResult? Function(NoRequestsYet value)? noRequestsYet,
    TResult? Function(TotalRequestSenderSendState value)?
        totalRequestSenderSendState,
    TResult? Function(ErrorInRequests value)? errorInRequests,
    TResult? Function(RequestsLoading value)? requestLoading,
    TResult? Function(RequestSendSuccessfully value)? requestSendSuccessfully,
    TResult? Function(CheckingUserAvailableState value)?
        checkingUserAvailableState,
  }) {
    final _that = this;
    switch (_that) {
      case Initial() when initial != null:
        return initial(_that);
      case NoRequestsYet() when noRequestsYet != null:
        return noRequestsYet(_that);
      case TotalRequestSenderSendState()
          when totalRequestSenderSendState != null:
        return totalRequestSenderSendState(_that);
      case ErrorInRequests() when errorInRequests != null:
        return errorInRequests(_that);
      case RequestsLoading() when requestLoading != null:
        return requestLoading(_that);
      case RequestSendSuccessfully() when requestSendSuccessfully != null:
        return requestSendSuccessfully(_that);
      case CheckingUserAvailableState() when checkingUserAvailableState != null:
        return checkingUserAvailableState(_that);
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
    TResult Function(List<Requestmodel> senderData)?
        totalRequestSenderSendState,
    TResult Function(String errorMessage)? errorInRequests,
    TResult Function()? requestLoading,
    TResult Function()? requestSendSuccessfully,
    TResult Function(Requestmodel? userData)? checkingUserAvailableState,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case Initial() when initial != null:
        return initial();
      case NoRequestsYet() when noRequestsYet != null:
        return noRequestsYet();
      case TotalRequestSenderSendState()
          when totalRequestSenderSendState != null:
        return totalRequestSenderSendState(_that.senderData);
      case ErrorInRequests() when errorInRequests != null:
        return errorInRequests(_that.errorMessage);
      case RequestsLoading() when requestLoading != null:
        return requestLoading();
      case RequestSendSuccessfully() when requestSendSuccessfully != null:
        return requestSendSuccessfully();
      case CheckingUserAvailableState() when checkingUserAvailableState != null:
        return checkingUserAvailableState(_that.userData);
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
    required TResult Function(List<Requestmodel> senderData)
        totalRequestSenderSendState,
    required TResult Function(String errorMessage) errorInRequests,
    required TResult Function() requestLoading,
    required TResult Function() requestSendSuccessfully,
    required TResult Function(Requestmodel? userData)
        checkingUserAvailableState,
  }) {
    final _that = this;
    switch (_that) {
      case Initial():
        return initial();
      case NoRequestsYet():
        return noRequestsYet();
      case TotalRequestSenderSendState():
        return totalRequestSenderSendState(_that.senderData);
      case ErrorInRequests():
        return errorInRequests(_that.errorMessage);
      case RequestsLoading():
        return requestLoading();
      case RequestSendSuccessfully():
        return requestSendSuccessfully();
      case CheckingUserAvailableState():
        return checkingUserAvailableState(_that.userData);
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
    TResult? Function(List<Requestmodel> senderData)?
        totalRequestSenderSendState,
    TResult? Function(String errorMessage)? errorInRequests,
    TResult? Function()? requestLoading,
    TResult? Function()? requestSendSuccessfully,
    TResult? Function(Requestmodel? userData)? checkingUserAvailableState,
  }) {
    final _that = this;
    switch (_that) {
      case Initial() when initial != null:
        return initial();
      case NoRequestsYet() when noRequestsYet != null:
        return noRequestsYet();
      case TotalRequestSenderSendState()
          when totalRequestSenderSendState != null:
        return totalRequestSenderSendState(_that.senderData);
      case ErrorInRequests() when errorInRequests != null:
        return errorInRequests(_that.errorMessage);
      case RequestsLoading() when requestLoading != null:
        return requestLoading();
      case RequestSendSuccessfully() when requestSendSuccessfully != null:
        return requestSendSuccessfully();
      case CheckingUserAvailableState() when checkingUserAvailableState != null:
        return checkingUserAvailableState(_that.userData);
      case _:
        return null;
    }
  }
}

/// @nodoc

class Initial implements RequestSenderState {
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
    return 'RequestSenderState.initial()';
  }
}

/// @nodoc

class NoRequestsYet implements RequestSenderState {
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
    return 'RequestSenderState.noRequestsYet()';
  }
}

/// @nodoc

class TotalRequestSenderSendState implements RequestSenderState {
  const TotalRequestSenderSendState(
      {required final List<Requestmodel> senderData})
      : _senderData = senderData;

  final List<Requestmodel> _senderData;
  List<Requestmodel> get senderData {
    if (_senderData is EqualUnmodifiableListView) return _senderData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_senderData);
  }

  /// Create a copy of RequestSenderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TotalRequestSenderSendStateCopyWith<TotalRequestSenderSendState>
      get copyWith => _$TotalRequestSenderSendStateCopyWithImpl<
          TotalRequestSenderSendState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TotalRequestSenderSendState &&
            const DeepCollectionEquality()
                .equals(other._senderData, _senderData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_senderData));

  @override
  String toString() {
    return 'RequestSenderState.totalRequestSenderSendState(senderData: $senderData)';
  }
}

/// @nodoc
abstract mixin class $TotalRequestSenderSendStateCopyWith<$Res>
    implements $RequestSenderStateCopyWith<$Res> {
  factory $TotalRequestSenderSendStateCopyWith(
          TotalRequestSenderSendState value,
          $Res Function(TotalRequestSenderSendState) _then) =
      _$TotalRequestSenderSendStateCopyWithImpl;
  @useResult
  $Res call({List<Requestmodel> senderData});
}

/// @nodoc
class _$TotalRequestSenderSendStateCopyWithImpl<$Res>
    implements $TotalRequestSenderSendStateCopyWith<$Res> {
  _$TotalRequestSenderSendStateCopyWithImpl(this._self, this._then);

  final TotalRequestSenderSendState _self;
  final $Res Function(TotalRequestSenderSendState) _then;

  /// Create a copy of RequestSenderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? senderData = null,
  }) {
    return _then(TotalRequestSenderSendState(
      senderData: null == senderData
          ? _self._senderData
          : senderData // ignore: cast_nullable_to_non_nullable
              as List<Requestmodel>,
    ));
  }
}

/// @nodoc

class ErrorInRequests implements RequestSenderState {
  const ErrorInRequests({required this.errorMessage});

  final String errorMessage;

  /// Create a copy of RequestSenderState
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
    return 'RequestSenderState.errorInRequests(errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $ErrorInRequestsCopyWith<$Res>
    implements $RequestSenderStateCopyWith<$Res> {
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

  /// Create a copy of RequestSenderState
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

/// @nodoc

class RequestsLoading implements RequestSenderState {
  const RequestsLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RequestsLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RequestSenderState.requestLoading()';
  }
}

/// @nodoc

class RequestSendSuccessfully implements RequestSenderState {
  const RequestSendSuccessfully();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RequestSendSuccessfully);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RequestSenderState.requestSendSuccessfully()';
  }
}

/// @nodoc

class CheckingUserAvailableState implements RequestSenderState {
  const CheckingUserAvailableState({required this.userData});

  final Requestmodel? userData;

  /// Create a copy of RequestSenderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CheckingUserAvailableStateCopyWith<CheckingUserAvailableState>
      get copyWith =>
          _$CheckingUserAvailableStateCopyWithImpl<CheckingUserAvailableState>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CheckingUserAvailableState &&
            (identical(other.userData, userData) ||
                other.userData == userData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userData);

  @override
  String toString() {
    return 'RequestSenderState.checkingUserAvailableState(userData: $userData)';
  }
}

/// @nodoc
abstract mixin class $CheckingUserAvailableStateCopyWith<$Res>
    implements $RequestSenderStateCopyWith<$Res> {
  factory $CheckingUserAvailableStateCopyWith(CheckingUserAvailableState value,
          $Res Function(CheckingUserAvailableState) _then) =
      _$CheckingUserAvailableStateCopyWithImpl;
  @useResult
  $Res call({Requestmodel? userData});

  $RequestmodelCopyWith<$Res>? get userData;
}

/// @nodoc
class _$CheckingUserAvailableStateCopyWithImpl<$Res>
    implements $CheckingUserAvailableStateCopyWith<$Res> {
  _$CheckingUserAvailableStateCopyWithImpl(this._self, this._then);

  final CheckingUserAvailableState _self;
  final $Res Function(CheckingUserAvailableState) _then;

  /// Create a copy of RequestSenderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userData = freezed,
  }) {
    return _then(CheckingUserAvailableState(
      userData: freezed == userData
          ? _self.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as Requestmodel?,
    ));
  }

  /// Create a copy of RequestSenderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RequestmodelCopyWith<$Res>? get userData {
    if (_self.userData == null) {
      return null;
    }

    return $RequestmodelCopyWith<$Res>(_self.userData!, (value) {
      return _then(_self.copyWith(userData: value));
    });
  }
}

// dart format on
