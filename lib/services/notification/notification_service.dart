// Notification for app
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';


// Background handler must be a top-level function
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  Logger().d("Handling a background message: ${message.messageId}");
}


 

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotifications() async {
    // Firebase setup
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    // Request permission (especially iOS)
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    Logger().d("Permission status: ${settings.authorizationStatus}");

    // FCM token
    final String? token = await messaging.getToken();
    Logger().d("FCM token: $token");



    // Handle background messages
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Foreground message handling
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      Logger().d("Foreground message: ${message.notification?.title}");
      _showDialogOrNotification(message);
    });

    // App opened from terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        Logger().d("App opened from terminated state");
        _showDialogOrNotification(message);
      }
    });

    // When app is in background and user taps notification
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      Logger().d("App opened from background via notification");
      _showDialogOrNotification(message);
    });

    // Local notification init
    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const iosSettings = DarwinInitializationSettings();
    const initializationSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );
    await notificationsPlugin.initialize(initializationSettings);
  }

  /// Show a GetX dialog for foreground, or local notification otherwise
void _showDialogOrNotification(RemoteMessage message) {
  final String title = message.notification?.title ?? "No Title";
  final String body = message.notification?.body ?? "No Body";

  if (Get.isDialogOpen ?? false) return; // prevent multiple dialogs

  if (Get.context != null) {
    // Foreground: show notification-like dialog
    Get.dialog(
      GestureDetector(
        onTap: () {
          Get.back();
          // Navigate to relevant screen
        },
        child: Align(
          alignment: Alignment.topCenter,
          child: Material(
            color: Colors.transparent,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.only(top: 50, left: 16, right: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.notifications, color: Colors.blue),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              body,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(
                        Icons.close,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      barrierColor: Colors.transparent,
    );

    // Auto-dismiss after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      if (Get.isDialogOpen ?? false) Get.back();
    });
  } else {
    // Background/terminated: show local notification
    showInstanceNotification(id: 0, title: title, body: body);
  }
}



  Future<void> showInstanceNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'instant_notification_channel_id',
      'Instant Notification',
      channelDescription: "Channel for instant notifications",
      importance: Importance.max,
      priority: Priority.high,
    );

    const notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: DarwinNotificationDetails(),
    );

    await notificationsPlugin.show(id, title, body, notificationDetails);
  }
}
