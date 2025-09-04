import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:timirama/services/status/model/status_model.dart';

class StatusRepository {
  final FirebaseAuth firebaseAuth;
  final Map<String, StreamSubscription<StatusModel?>> _statusSubscriptions = {};
  StreamSubscription<DatabaseEvent>? _presenceSubscription;

  // Debug flag - can be controlled via environment or build configuration
  static const bool _debugMode = true;

  StatusRepository({FirebaseAuth? auth})
      : firebaseAuth = auth ?? FirebaseAuth.instance;

  //-User Presence-
  void setupUserPresence() {
    final user = firebaseAuth.currentUser;
    if (user == null) return;

    final uid = user.uid;
    final userStatusDatabaseRef = FirebaseDatabase.instance.ref("status/$uid");
    final connectedRef = FirebaseDatabase.instance.ref(".info/connected");

    if (_debugMode) {
      print('Setting up user presence for user: $uid');
    }

    // Immediately set user as online
    _setUserOnline(uid);

    _presenceSubscription?.cancel();
    _presenceSubscription = connectedRef.onValue.listen((event) {
      final isConnected = event.snapshot.value as bool? ?? false;

      if (_debugMode) {
        print('Firebase connection status: $isConnected for user: $uid');
      }

      if (isConnected) {
        // Set offline status when user disconnects
        userStatusDatabaseRef.onDisconnect().set({
          'state': false,
          'last_changed': ServerValue.timestamp,
        });

        // Set online status immediately
        _setUserOnline(uid);
      } else {
        if (_debugMode) {
          print('Firebase disconnected for user: $uid');
        }
      }
    }, onError: (error) {
      if (_debugMode) {
        print('Error in presence setup for user $uid: $error');
      }
    });
  }

  // Helper method to set user as online
  Future<void> _setUserOnline(String userId) async {
    try {
      final userStatusRef = FirebaseDatabase.instance.ref("status/$userId");
      await userStatusRef.set({
        'state': true,
        'last_changed': ServerValue.timestamp,
      });

      if (_debugMode) {
        print('Successfully set user $userId as online');
      }
    } catch (e) {
      if (_debugMode) {
        print('Error setting user $userId as online: $e');
      }
    }
  }

  // Check and ensure current user is online
  Future<void> ensureCurrentUserOnline() async {
    final user = firebaseAuth.currentUser;
    if (user != null) {
      if (_debugMode) {
        print('Ensuring current user ${user.uid} is online');
      }
      await _setUserOnline(user.uid);

      // Verify the status was set
      final status = await getUserPreence(user.uid);
      if (_debugMode) {
        print('Verified user ${user.uid} status is now: ${status?.state}');
      }
    }
  }

  // Debug method to check current user status
  Future<void> debugCurrentUserStatus() async {
    final user = firebaseAuth.currentUser;
    if (user != null) {
      final status = await getUserPreence(user.uid);
      if (_debugMode) {
        print(
            'Current user ${user.uid} status: ${status?.state} (last changed: ${status?.lastChanged})');
      }
    }
  }

  // Test method to manually set user online/offline for debugging
  Future<void> testUserStatus(String userId, bool isOnline) async {
    try {
      await updateUserStatus(userId, isOnline);
      if (_debugMode) {
        print(
            'Test: Set user $userId status to ${isOnline ? "online" : "offline"}');
      }

      // Verify the change
      final status = await getUserPreence(userId);
      if (_debugMode) {
        print('Test: Verified user $userId status is now: ${status?.state}');
      }
    } catch (e) {
      if (_debugMode) {
        print('Test: Error setting user $userId status: $e');
      }
    }
  }

  // Get user presence with real-time updates
  Stream<StatusModel?> getUserPresenceStream(String userId) {
    // Check if we already have a stream for this user
    if (_statusSubscriptions.containsKey(userId)) {
      if (kDebugMode) {
        print('Reusing existing subscription for user $userId');
      }
      // Return the existing stream by creating a new one from the same reference
      final statusRef = FirebaseDatabase.instance.ref("status/$userId");
      return statusRef.onValue.map((event) {
        final rawData = event.snapshot.value;
        if (rawData != null && rawData is Map) {
          try {
            final data = Map<String, dynamic>.from(rawData);
            return StatusModel.fromMap(data);
          } catch (e) {
            if (kDebugMode) {
              print('Error parsing status data for user $userId: $e');
            }
            return null;
          }
        }
        return null;
      }).handleError((error) {
        if (kDebugMode) {
          print('Error in status stream for user $userId: $error');
        }
        return null;
      });
    }

    final statusRef = FirebaseDatabase.instance.ref("status/$userId");

    if (kDebugMode) {
      print('Creating new status stream for user $userId');
    }

    // Create a broadcast stream that can be listened to multiple times
    final stream = statusRef.onValue.map((event) {
      final rawData = event.snapshot.value;

      if (rawData != null && rawData is Map) {
        try {
          final data = Map<String, dynamic>.from(rawData);
          if (kDebugMode) {
            print('Status update for user $userId: ${data['state']} at ${data['last_changed']}');
          }
          return StatusModel.fromMap(data);
        } catch (e) {
          if (kDebugMode) {
            print('Error parsing status data for user $userId: $e');
          }
          return null;
        }
      }
      if (kDebugMode) {
        print('No status data found for user $userId');
      }
      return null;
    }).handleError((error) {
      if (kDebugMode) {
        print('Error in status stream for user $userId: $error');
      }
      return null;
    }).asBroadcastStream();

    // Store a dummy subscription for tracking
    final subscription = stream.listen(null, onError: (error) {
      if (kDebugMode) {
        print('Error in status stream listener for user $userId: $error');
      }
    });

    _statusSubscriptions[userId] = subscription;

    if (kDebugMode) {
      print(
          'Successfully created status stream for user $userId. Active subscriptions: ${_statusSubscriptions.length}');
    }

    return stream;
  }

  // Get user presence once (for backward compatibility)
  Future<StatusModel?> getUserPreence(String id) async {
    try {
      final statusRef = FirebaseDatabase.instance.ref("status/$id");
      final DatabaseEvent event = await statusRef.once();
      final rawData = event.snapshot.value;

      if (rawData != null && rawData is Map) {
        final data = Map<String, dynamic>.from(rawData);
        return StatusModel.fromMap(data);
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print('Error getting user presence: $e');
      }
      return null;
    }
  }

  // Update user status manually (for testing or manual control)
  Future<void> updateUserStatus(String userId, bool isOnline) async {
    try {
      final userStatusRef = FirebaseDatabase.instance.ref("status/$userId");
      await userStatusRef.set({
        'state': isOnline,
        'last_changed': ServerValue.timestamp,
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error updating user status: $e');
      }
    }
  }

  // Clean up all subscriptions
  void dispose() {
    if (_debugMode) {
      print('StatusRepository: Disposing all subscriptions and connections');
    }
    
    _presenceSubscription?.cancel();
    _presenceSubscription = null;
    
    for (final subscription in _statusSubscriptions.values) {
      subscription.cancel();
    }
    _statusSubscriptions.clear();
    
    if (_debugMode) {
      print('StatusRepository: Successfully disposed all resources');
    }
  }

  // Clean up specific user subscription
  void disposeUserSubscription(String userId) {
    if (_debugMode) {
      print('StatusRepository: Disposing subscription for user $userId');
    }
    
    _statusSubscriptions[userId]?.cancel();
    _statusSubscriptions.remove(userId);
    
    if (_debugMode) {
      print('StatusRepository: Remaining subscriptions: ${_statusSubscriptions.length}');
    }
  }

  // Clean up presence subscription specifically
  void disposePresenceSubscription() {
    if (_debugMode) {
      print('StatusRepository: Disposing presence subscription');
    }
    
    _presenceSubscription?.cancel();
    _presenceSubscription = null;
  }
}
