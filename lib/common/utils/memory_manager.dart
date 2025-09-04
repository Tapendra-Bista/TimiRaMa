import 'dart:async';
import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

/// Memory management utility to help track and manage app resources
class MemoryManager {
  static final MemoryManager _instance = MemoryManager._internal();
  factory MemoryManager() => _instance;
  MemoryManager._internal();

  final Map<String, StreamSubscription> _activeSubscriptions = {};
  final Map<String, Timer> _activeTimers = {};
  final Set<String> _activeControllers = {};
  
  static const bool _debugMode = kDebugMode;

  /// Register a stream subscription for tracking
  void registerSubscription(String key, StreamSubscription subscription) {
    if (_debugMode) {
      developer.log('MemoryManager: Registering subscription: $key');
    }
    
    // Cancel existing subscription if any
    _activeSubscriptions[key]?.cancel();
    _activeSubscriptions[key] = subscription;
    
    if (_debugMode) {
      developer.log('MemoryManager: Active subscriptions: ${_activeSubscriptions.length}');
    }
  }

  /// Register a timer for tracking
  void registerTimer(String key, Timer timer) {
    if (_debugMode) {
      developer.log('MemoryManager: Registering timer: $key');
    }
    
    // Cancel existing timer if any
    _activeTimers[key]?.cancel();
    _activeTimers[key] = timer;
    
    if (_debugMode) {
      developer.log('MemoryManager: Active timers: ${_activeTimers.length}');
    }
  }

  /// Register a controller for tracking
  void registerController(String key) {
    if (_debugMode) {
      developer.log('MemoryManager: Registering controller: $key');
    }
    
    _activeControllers.add(key);
    
    if (_debugMode) {
      developer.log('MemoryManager: Active controllers: ${_activeControllers.length}');
    }
  }

  /// Cancel and remove a specific subscription
  void cancelSubscription(String key) {
    final subscription = _activeSubscriptions.remove(key);
    if (subscription != null) {
      subscription.cancel();
      if (_debugMode) {
        developer.log('MemoryManager: Cancelled subscription: $key');
      }
    }
  }

  /// Cancel and remove a specific timer
  void cancelTimer(String key) {
    final timer = _activeTimers.remove(key);
    if (timer != null) {
      timer.cancel();
      if (_debugMode) {
        developer.log('MemoryManager: Cancelled timer: $key');
      }
    }
  }

  /// Remove a controller from tracking
  void removeController(String key) {
    if (_activeControllers.remove(key)) {
      if (_debugMode) {
        developer.log('MemoryManager: Removed controller: $key');
      }
    }
  }

  /// Cancel all subscriptions for a specific prefix (e.g., "chat_", "status_")
  void cancelSubscriptionsWithPrefix(String prefix) {
    final keysToRemove = <String>[];
    
    for (final key in _activeSubscriptions.keys) {
      if (key.startsWith(prefix)) {
        keysToRemove.add(key);
      }
    }
    
    for (final key in keysToRemove) {
      cancelSubscription(key);
    }
    
    if (_debugMode && keysToRemove.isNotEmpty) {
      developer.log('MemoryManager: Cancelled ${keysToRemove.length} subscriptions with prefix: $prefix');
    }
  }

  /// Cancel all timers for a specific prefix
  void cancelTimersWithPrefix(String prefix) {
    final keysToRemove = <String>[];
    
    for (final key in _activeTimers.keys) {
      if (key.startsWith(prefix)) {
        keysToRemove.add(key);
      }
    }
    
    for (final key in keysToRemove) {
      cancelTimer(key);
    }
    
    if (_debugMode && keysToRemove.isNotEmpty) {
      developer.log('MemoryManager: Cancelled ${keysToRemove.length} timers with prefix: $prefix');
    }
  }

  /// Get memory usage statistics
  Map<String, int> getMemoryStats() {
    return {
      'activeSubscriptions': _activeSubscriptions.length,
      'activeTimers': _activeTimers.length,
      'activeControllers': _activeControllers.length,
    };
  }

  /// Log current memory usage
  void logMemoryStats() {
    if (_debugMode) {
      final stats = getMemoryStats();
      developer.log('MemoryManager Stats: $stats');
    }
  }

  /// Clean up all resources (use with caution)
  void dispose() {
    if (_debugMode) {
      developer.log('MemoryManager: Disposing all resources');
    }
    
    // Cancel all subscriptions
    for (final subscription in _activeSubscriptions.values) {
      subscription.cancel();
    }
    _activeSubscriptions.clear();
    
    // Cancel all timers
    for (final timer in _activeTimers.values) {
      timer.cancel();
    }
    _activeTimers.clear();
    
    // Clear controllers
    _activeControllers.clear();
    
    if (_debugMode) {
      developer.log('MemoryManager: All resources disposed');
    }
  }

  /// Check for potential memory leaks
  List<String> checkForLeaks() {
    final warnings = <String>[];
    
    if (_activeSubscriptions.length > 50) {
      warnings.add('High number of active subscriptions: ${_activeSubscriptions.length}');
    }
    
    if (_activeTimers.length > 20) {
      warnings.add('High number of active timers: ${_activeTimers.length}');
    }
    
    if (_activeControllers.length > 100) {
      warnings.add('High number of active controllers: ${_activeControllers.length}');
    }
    
    return warnings;
  }
}
