part of 'request_receiver_bloc.dart';

@freezed
abstract class RequestReceiverEvent with _$RequestReceiverEvent {
  const factory RequestReceiverEvent.started() = _Started;

  const factory RequestReceiverEvent.messagesRequestsGet() = RequestReceiverGet;

  const factory RequestReceiverEvent.messagesRequestsUnreadCount() =
      RequestReceiverUnreadCount;
  const factory RequestReceiverEvent.acceptRequest(
      {required String senderId, required String receiverId}) = AcceptRequest;
}
