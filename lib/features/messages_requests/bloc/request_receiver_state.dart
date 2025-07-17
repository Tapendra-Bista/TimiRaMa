part of 'request_receiver_bloc.dart';

@freezed
 abstract     class RequestReceiverState with _$RequestReceiverState {
  const factory RequestReceiverState.initial() = _Initial;
    const factory RequestReceiverState.noRequestsYet() = NoRequestsYet;
  const factory RequestReceiverState.getRequests(
      {required List<Requestmodel> receiverData}) = GetRequests;

  const factory RequestReceiverState.getUnreadCount({required int count}) =
      GetUnreadCount;
  const factory RequestReceiverState.errorInRequests(
      {required String errorMessage}) = ErrorInRequests;

}
