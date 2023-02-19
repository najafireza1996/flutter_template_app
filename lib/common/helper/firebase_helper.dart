import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:url_launcher/url_launcher.dart';

class FirebaseHelper {
  factory FirebaseHelper() {
    return _singleton;
  }

  FirebaseHelper._internal() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      importance: Importance.max,
    );
  }

  static final FirebaseHelper _singleton = FirebaseHelper._internal();
  static late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  static late AndroidNotificationChannel channel;
  Future initFireBaseCloudMessaging() async {
    try {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);
      NotificationSettings settings =
          await FirebaseMessaging.instance.requestPermission(
        alert: true,
        badge: true,
        provisional: false,
        sound: true,
      );
      try {
        final fcmToken = await FirebaseMessaging.instance.getToken();
        if (kDebugMode) {
          print(fcmToken);
        }
        // ignore: empty_catches
      } catch (e) {}

      FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
        // TODO: If necessary send token to application server.

        // Note: This callback is fired at each app startup and whenever a new
        // token is generated.
      }).onError((err) {
        // Error getting token.
      });
      // Future<void> _firebaseMessagingBackgroundHandler(
      //     RemoteMessage message) async {
      //   print("onBackgroundMessage: $message");
      // }

      // FirebaseMessaging.onBackgroundMessage(
      //     _firebaseMessagingBackgroundHandler);

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        if (notification != null && android != null && !kIsWeb) {
          // if (message.data["url"] != null &&
          //     message.data["url"].toString().isNotEmpty) {
          //   try {
          //     await launchUrl(
          //       Uri.parse(message.data["url"]),
          //       mode: LaunchMode.externalApplication,
          //     );
          //     return;
          //   } catch (e) {
          //     print(e.toString());
          //   }
          // }

          flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id, channel.name,
                importance: Importance.max,
                channelDescription: channel.description,
                priority: Priority.high,
                //ongoing: true,
                styleInformation: const BigTextStyleInformation(''),
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                icon: 'ic_launcher',
              ),
            ),
          );
        }
      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        if (notification != null && android != null && !kIsWeb) {
          if (message.data["url"] != null &&
              message.data["url"].toString().isNotEmpty) {
            try {
              launchUrl(
                Uri.parse(message.data["url"]),
                mode: LaunchMode.externalApplication,
              );
              return;
            } catch (e) {
              print(e.toString());
            }
          }

          flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id, channel.name,
                importance: Importance.max,
                channelDescription: channel.description,
                priority: Priority.high,
                //ongoing: true,
                styleInformation: const BigTextStyleInformation(''),
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                icon: 'ic_launcher',
              ),
            ),
          );
        }
      });

      // ignore: empty_catches
    } catch (e) {}
  }
  // Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  //   RemoteNotification? notification = message.notification;
  //   AndroidNotification? android = message.notification?.android;
  //   if (notification != null && android != null && !kIsWeb) {
  //     flutterLocalNotificationsPlugin.show(
  //       notification.hashCode,
  //       notification.title,
  //       notification.body,
  //       NotificationDetails(
  //         android: AndroidNotificationDetails(
  //           channel.id,
  //           channel.name,
  //           channelDescription: channel.description,
  //           // TODO add a proper drawable resource to android, for now using
  //           //      one that already exists in example app.
  //           icon: 'launch_background',
  //         ),
  //       ),
  //     );
  //   }
  // }
}
