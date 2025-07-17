part of 'request_sender_bloc.dart';

//-------------------- State -----------------
@freezed
abstract class RequestSenderState with _$RequestSenderState {
  const factory RequestSenderState.initial() = Initial;
  const factory RequestSenderState.noRequestsYet() = NoRequestsYet;

  const factory RequestSenderState.totalRequestSenderSendState(
          {required List<Requestmodel> senderData}) =
      TotalRequestSenderSendState;

  const factory RequestSenderState.errorInRequests(
      {required String errorMessage}) = ErrorInRequests;

  const factory RequestSenderState.requestLoading() = RequestsLoading;
  const factory RequestSenderState.requestSendSuccessfully() =
      RequestSendSuccessfully;

  const factory RequestSenderState.checkingUserAvailableState(
      {required Requestmodel? userData}) = CheckingUserAvailableState;
}
