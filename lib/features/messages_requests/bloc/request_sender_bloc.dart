import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timirama/features/messages_requests/model/request_model.dart';
import 'package:timirama/features/messages_requests/repository/request_repository.dart';

part 'request_sender_bloc.freezed.dart';
part 'request_sender_event.dart';
part 'request_sender_state.dart';

//- Bloc  -
class RequestSenderBloc extends Bloc<RequestSenderEvent, RequestSenderState> {
  final RequestRepository _requestsRepository;

  RequestSenderBloc({required RequestRepository repository})
      : _requestsRepository = repository,
        super(RequestSenderState.initial()) {
    on<RequestSenderSend>(_onRequestSenderSend);

    on<RequestSenderDelete>(_onRequestSenderDelete);

    on<CheckingUserAvailableEvent>(_onCheckingUserAvailableEvent);
    on<TotalRequestSenderSend>(_onTotalRequestSenderSend);
  }

  //- requests  send 
  Future<void> _onRequestSenderSend(
    RequestSenderSend event,
    Emitter<RequestSenderState> emit,
  ) async {
    try {
      emit(RequestSenderState.requestLoading());
      final Requestmodel model = Requestmodel(
        senderProfile: event.senderProfile,
        senderName: event.senderName,
        senderId: event.senderId,
        responseStatus: ResponseStatus.Initial,
        requestStatus: RequestStatus.Send,
        receiverId: event.receiverId,
        receiverName: event.receiverName,
        receiverProfile: event.receiverProfile,
        createdAt: Timestamp.fromDate(DateTime.now()),
      );

      await _requestsRepository.sendRequests(model);
      emit(RequestSenderState.requestSendSuccessfully());
      add(
        CheckingUserAvailableEvent(
          senderId: event.senderId,
          receiverId: event.receiverId,
        ),
      );
    } catch (e) {
      print("Error while sending requests  ${e.toString()}");
      emit(RequestSenderState.errorInRequests(errorMessage: e.toString()));
    }
  }

  // Delete request -
  Future<void> _onRequestSenderDelete(
    RequestSenderDelete event,
    Emitter<RequestSenderState> emit,
  ) async {
    await _requestsRepository.deleteRequests(
      senderId: event.senderId,
      receiverId: event.receiverId,
    );

    add(TotalRequestSenderSend());
  }

  // check whether available or not
  Future<void> _onCheckingUserAvailableEvent(
    CheckingUserAvailableEvent event,
    Emitter<RequestSenderState> emit,
  ) async {
    try {
      final Requestmodel? data = await _requestsRepository.isUserAvailable(
        senderId: event.senderId,
        receiverId: event.receiverId,
      );

      emit(RequestSenderState.checkingUserAvailableState(userData: data));
    } catch (e) {
      print("Error in while checking  ${e.toString()}");
      emit(RequestSenderState.errorInRequests(errorMessage: e.toString()));
    }
  }

  Future<void> _onTotalRequestSenderSend(
    TotalRequestSenderSend event,
    Emitter<RequestSenderState> emit,
  ) async {
    try {
      final List<Requestmodel> getSendRequests =
          await _requestsRepository.sendRequestsList();
      if (getSendRequests.isEmpty) {
        emit(RequestSenderState.noRequestsYet());
      } else {
        emit(
          RequestSenderState.totalRequestSenderSendState(
            senderData: getSendRequests,
          ),
        );
      }
    } catch (e) {
      print("Error while fetching total sent requests");
      emit(RequestSenderState.errorInRequests(errorMessage: e.toString()));
    }
  }
}
