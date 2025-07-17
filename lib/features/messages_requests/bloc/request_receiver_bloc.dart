import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timirama/features/archive/model/archive_model.dart';
import 'package:timirama/features/archive/repository/archive_repository.dart';
import 'package:timirama/features/messages_requests/model/request_model.dart';
import 'package:timirama/features/messages_requests/repository/request_repository.dart';
import 'package:timirama/services/service_locator/service_locator.dart';

part 'request_receiver_bloc.freezed.dart';
part 'request_receiver_event.dart';
part 'request_receiver_state.dart';

class RequestReceiverBloc
    extends Bloc<RequestReceiverEvent, RequestReceiverState> {
  final RequestRepository _requestsRepository;

  RequestReceiverBloc({required RequestRepository repository})
    : _requestsRepository = repository,
      super(RequestReceiverState.initial()) {
    on<RequestReceiverGet>(_onMessageRequestsGet);
    on<RequestReceiverUnreadCount>(_onMessageRequestsUnreadCount);

    on<AcceptRequest>(_onAcceptRequest);
  }

  // Requests Get
  Future<void> _onMessageRequestsGet(
    RequestReceiverGet event,
    Emitter<RequestReceiverState> emit,
  ) async {
    try {
      final List<Requestmodel> getTotalRequests = await _requestsRepository
          .fetchRequests();
      final ArchiveModel? archive = await getIt<ArchiveRepository>()
          .fetchArchives();
      if (getTotalRequests.isEmpty) {
        emit(RequestReceiverState.noRequestsYet());
      } else {
        final filterData = getTotalRequests
            .where(
              (item) => !(archive?.archiveId.contains(item.senderId) ?? false),
            )
            .toList();
        emit(RequestReceiverState.getRequests(receiverData: filterData));
      }
      await _requestsRepository.markAsRead();
    } catch (e) {
      print("Error in Requests fetch !");
      emit(RequestReceiverState.errorInRequests(errorMessage: e.toString()));
    }
  }

  // Unread requests
  Future<void> _onMessageRequestsUnreadCount(
    RequestReceiverUnreadCount event,
    Emitter<RequestReceiverState> emit,
  ) async {
    final count = await _requestsRepository.unReadRequests();
    emit(RequestReceiverState.getUnreadCount(count: count));
    print("Unread requests are $count");
  }

  // Request Accept
  Future<void> _onAcceptRequest(
    AcceptRequest event,
    Emitter<RequestReceiverState> emit,
  ) async {
    await _requestsRepository.acceptRequest(
      senderId: event.senderId,
      receiverId: event.receiverId,
    );

    add(RequestReceiverGet());
  }
}
