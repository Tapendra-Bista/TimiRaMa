part of 'request_sender_bloc.dart';

// Event
@freezed
abstract class RequestSenderEvent with _$RequestSenderEvent {
  const factory RequestSenderEvent.messagesRequestsSend({
    required String senderProfile,
    required String senderName,
    required String senderId,
    required String receiverId,
    required String receiverProfile,
    required String receiverName,
  }) = RequestSenderSend;

  const factory RequestSenderEvent.totalRequestSenderSend() =
      TotalRequestSenderSend;
  const factory RequestSenderEvent.messagesRequestsDelete(
      {required String senderId,
      required String receiverId}) = RequestSenderDelete;

  const factory RequestSenderEvent.checkingUserAvailableEvent(
      {required String senderId,
      required String receiverId}) = CheckingUserAvailableEvent;
}
