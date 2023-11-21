import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/prefs/shared_pref_controller.dart';

//typedef BackgroundMessageHandler = Future<void> Function(RemoteMessage message);
Future<void> firebaseMessagingBackgroundHandler(
    RemoteMessage remoteMessage) async {
  //BACKGROUND Notifications - iOS & Android
  await Firebase.initializeApp();
  debugPrint('Message: ${remoteMessage.messageId}');
}

late AndroidNotificationChannel channel;
late FlutterLocalNotificationsPlugin localNotificationsPlugin;

mixin FbNotifications {
  /// CALLED IN main function between ensureInitialized <-> runApp(widget);
  static Future<void> initNotifications() async {
    //Connect the previous created function with onBackgroundMessage to enable
    //receiving notification when app in Background.
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    //Channel
    if (!kIsWeb) {
      channel = const AndroidNotificationChannel(
        'haraj_app_notification_channel',
        'Haraj App Notifications Channel',
        description:
            'This channel will receive notifications specific to Haraj App',
        importance: Importance.high,
        enableLights: true,
        enableVibration: true,
        ledColor: ColorResource.mainColor,
        showBadge: true,
        playSound: true,
      );
    }
    localNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const initializationSettingsAndroid = AndroidInitializationSettings(
        // '@mipmap/launcher_icon',
        "@mipmap/ic_launcher");

    const initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await localNotificationsPlugin.initialize(initializationSettings);
    //Flutter Local Notifications Plugin (FOREGROUND) - ANDROID CHANNEL
    await localNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    //iOS Notification Setup (FOREGROUND)
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  //iOS Notification Permission
  Future<void> requestNotificationPermissions() async {
    debugPrint('requestNotificationPermissions');
    NotificationSettings notificationSettings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      carPlay: false,
      announcement: false,
      provisional: false,
      criticalAlert: false,
    );
    if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.authorized) {
      FirebaseMessaging.instance.requestPermission();
      debugPrint('GRANT PERMISSION');
    } else if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.denied) {
      FirebaseMessaging.instance.requestPermission();
      debugPrint('Permission Denied');
    }
  }

  //ANDROID
  static void initializeForegroundNotificationForAndroid(BuildContext context) {
    if (SharedPrefController().type == 2) {
      FirebaseMessaging.instance.subscribeToTopic(
          Localizations.localeOf(context).languageCode == 'en'
              ? 'all_buyers_en'
              : 'all_buyers_ar');
    }
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('Message Received: ${message.data}');
      debugPrint('Notification title: ${message.notification?.title}');
      debugPrint('Notification body: ${message.notification?.body}');
      RemoteNotification? notification = message.notification;
      AndroidNotification? androidNotification = notification?.android;
      if (notification != null && androidNotification != null) {
        localNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              // icon: 'ic_stat_ic_notification',
            ),
          ),
        );
      }
    });
  }

  static Future<void> getToken() async {
    await FirebaseMessaging.instance.getToken().then((value) {
      SharedPrefController().fcmToken = value;
      debugPrint("Token device📲=>  $value ");
    });
  }
}
