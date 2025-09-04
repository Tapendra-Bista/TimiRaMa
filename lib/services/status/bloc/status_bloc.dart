import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timirama/services/status/bloc/status_event.dart';
import 'package:timirama/services/status/bloc/status_state.dart';
import 'package:timirama/services/status/model/status_model.dart';
import 'package:timirama/services/status/repository/status_repository.dart';

class StatusBloc extends Bloc<StatusEvent, StatusState> {
  final StatusRepository _repository;
  final Map<String, StreamSubscription<StatusModel?>> _statusSubscriptions = {};
  final Map<String, StatusModel> _userStatuses = {};

  // Debug flag - can be controlled via environment or build configuration
  static const bool _debugMode = true;

  StatusBloc({required StatusRepository statusrepository})
      : _repository = statusrepository,
        super(StatusInitial()) {
    on<GetStatus>((GetStatus event, Emitter<StatusState> emit) async {
      final user = await FirebaseAuth.instance.authStateChanges().first;

      if (user != null) {
        final StatusModel? data = await _repository.getUserPreence(event.uid);
        if (data != null && !emit.isDone) {
          emit(state.copyWith(status: data));
        }
      }
    });

    on<GetCurrentStatus>((GetCurrentStatus event, Emitter<StatusState> emit) async {
      // Get current status without starting a subscription
      if (_debugMode) {
        print('Getting current status for user ${event.uid}');
      }
      
      try {
        final StatusModel? data = await _repository.getUserPreence(event.uid);
        if (data != null && !emit.isDone) {
          _userStatuses[event.uid] = data;
          emit(state.copyWith(
            status: data,
            userStatuses: Map.from(_userStatuses),
            currentUserId: event.uid,
          ));
          if (_debugMode) {
            print('Current status for user ${event.uid}: ${data.state}');
          }
        }
      } catch (e) {
        if (_debugMode) {
          print('Error getting current status for user ${event.uid}: $e');
        }
      }
    });

    on<ListenToStatus>((ListenToStatus event, Emitter<StatusState> emit) async {
      // Check if we're already listening to this user
      if (_isListeningToUser(event.uid)) {
        if (_debugMode) {
          print('Already listening to status for user ${event.uid}');
        }
        return;
      }

      if (_debugMode) {
        print('Starting to listen to status for user ${event.uid}');
      }

      try {
        // Start listening to real-time updates
        final subscription =
            _repository.getUserPresenceStream(event.uid).listen(
          (status) {
            if (_debugMode) {
              print(
                  'StatusBloc: Received status update for user ${event.uid}: ${status?.state} (last changed: ${status?.lastChanged})');
            }
            if (!emit.isDone) {
              final statusToUse = status ?? StatusModel.empty;
              _userStatuses[event.uid] = statusToUse;
              emit(state.copyWith(
                status: statusToUse,
                userStatuses: Map.from(_userStatuses),
                currentUserId: event.uid,
              ));
            }
          },
          onError: (error) {
            if (_debugMode) {
              print(
                  'StatusBloc: Error in status stream for user ${event.uid}: $error');
            }
            if (!emit.isDone) {
              _userStatuses[event.uid] = StatusModel.empty;
              emit(state.copyWith(
                status: StatusModel.empty,
                userStatuses: Map.from(_userStatuses),
                currentUserId: event.uid,
              ));
            }
          },
        );

        _statusSubscriptions[event.uid] = subscription;

        if (_debugMode) {
          print(
              'Successfully started listening to status for user ${event.uid}. Total subscriptions: ${_statusSubscriptions.length}');
        }
      } catch (e) {
        // Handle any errors in subscription setup
        if (_debugMode) {
          print(
              'Error setting up status subscription for user ${event.uid}: $e');
        }
      }
    });

    on<StopListeningToStatus>(
        (StopListeningToStatus event, Emitter<StatusState> emit) {
      if (_debugMode) {
        print('Stopping status listening for user ${event.uid}');
      }

      _statusSubscriptions[event.uid]?.cancel();
      _statusSubscriptions.remove(event.uid);
      _userStatuses.remove(event.uid);

      if (_debugMode) {
        print(
            'Stopped listening to status for user ${event.uid}. Remaining subscriptions: ${_statusSubscriptions.length}');
      }
    });

    on<UpdateStatus>((UpdateStatus event, Emitter<StatusState> emit) async {
      try {
        await _repository.updateUserStatus(event.userId, event.isOnline);
        // The stream will automatically update the state
      } catch (e) {
        if (_debugMode) {
          print('Error updating status for user ${event.userId}: $e');
        }
      }
    });

    on<GetUserStatus>((GetUserStatus event, Emitter<StatusState> emit) async {
      // Get status for a specific user from cache or fetch it
      if (_userStatuses.containsKey(event.uid)) {
        emit(state.copyWith(
          status: _userStatuses[event.uid]!,
          currentUserId: event.uid,
        ));
      } else {
        // Fetch from repository if not in cache
        try {
          final StatusModel? data = await _repository.getUserPreence(event.uid);
          if (data != null && !emit.isDone) {
            _userStatuses[event.uid] = data;
            emit(state.copyWith(
              status: data,
              userStatuses: Map.from(_userStatuses),
              currentUserId: event.uid,
            ));
          }
        } catch (e) {
          if (_debugMode) {
            print('Error getting user status for ${event.uid}: $e');
          }
        }
      }
    });
  }

  bool _isListeningToUser(String userId) {
    return _statusSubscriptions.containsKey(userId);
  }


  @override
  Future<void> close() {
    if (_debugMode) {
      print('StatusBloc: Disposing all subscriptions and clearing cache');
    }
    
    // Clean up all subscriptions
    for (final subscription in _statusSubscriptions.values) {
      subscription.cancel();
    }
    _statusSubscriptions.clear();
    _userStatuses.clear();
    
    if (_debugMode) {
      print('StatusBloc: Successfully disposed all resources');
    }
    
    return super.close();
  }

  /// Clean up specific user subscription to prevent memory leaks
  void disposeUserSubscription(String userId) {
    if (_debugMode) {
      print('StatusBloc: Disposing subscription for user $userId');
    }
    
    _statusSubscriptions[userId]?.cancel();
    _statusSubscriptions.remove(userId);
    _userStatuses.remove(userId);
    
    if (_debugMode) {
      print('StatusBloc: Remaining subscriptions: ${_statusSubscriptions.length}');
    }
  }
}
