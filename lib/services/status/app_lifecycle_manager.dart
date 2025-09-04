import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:timirama/services/status/repository/status_repository.dart';

class AppLifecycleManager extends StatefulWidget {
  final Widget child;
  final StatusRepository statusRepository;

  const AppLifecycleManager({
    super.key,
    required this.child,
    required this.statusRepository,
  });

  @override
  State<AppLifecycleManager> createState() => _AppLifecycleManagerState();
}

class _AppLifecycleManagerState extends State<AppLifecycleManager>
    with WidgetsBindingObserver {
  late StreamSubscription<AppLifecycleState> _lifecycleSubscription;
  bool _isAppInForeground = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // Set up user presence when the app starts
    if (FirebaseAuth.instance.currentUser != null) {
      widget.statusRepository.setupUserPresence();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _lifecycleSubscription.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    switch (state) {
      case AppLifecycleState.resumed:
        _handleAppResumed(user.uid);
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        _handleAppBackgrounded(user.uid);
        break;
      case AppLifecycleState.hidden:
        // Handle hidden state if needed
        break;
    }
  }

  void _handleAppResumed(String userId) {
    if (!_isAppInForeground) {
      _isAppInForeground = true;

      // Update status to online
      widget.statusRepository.updateUserStatus(userId, true);

      // Re-setup user presence
      widget.statusRepository.setupUserPresence();
    }
  }

  void _handleAppBackgrounded(String userId) {
    if (_isAppInForeground) {
      _isAppInForeground = false;

      // Update status to offline
      widget.statusRepository.updateUserStatus(userId, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
