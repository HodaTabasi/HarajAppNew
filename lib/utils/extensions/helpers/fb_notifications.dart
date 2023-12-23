import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/chat/controller/chat_details_controller.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';
import 'package:haraj/utils/models/chat/message.dart' as chat;
import 'package:haraj/utils/models/offer/post_model.dart';
import 'package:haraj/utils/models/seller_info/store_model.dart';
import 'package:haraj/utils/prefs/shared_pref_controller.dart';

import '../../../feature/app/chat/controller/chat_controller.dart';
import '../../../feature/app/chat/view/screen/home_chat_screen.dart';
import '../../../main.dart';

//typedef BackgroundMessageHandler = Future<void> Function(RemoteMessage message);

late AndroidNotificationChannel channel;
late FlutterLocalNotificationsPlugin localNotificationsPlugin;

mixin FbNotifications {
  /// CALLED IN main function between ensureInitialized <-> runApp(widget);
  static Future<void> initNotifications() async {
    //Connect the previous created function with onBackgroundMessage to enable
    //receiving notification when app in Background.
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
    await localNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (response) {
      notificationClicked(json.decode(response.payload ?? ''));
    });
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


  //ANDROID
  static Future<void> initializeForegroundNotificationForAndroid(BuildContext context) async {
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      carPlay: false,
      announcement: false,
      provisional: false,
      criticalAlert: false,
    );
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
      notificationAction(message);
      if (preventShowingNotification(message)) {
        return; //NO NOTIFICATION WILL BE SHOWN
      }
      if (notification != null && androidNotification != null) {
        localNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          payload: json.encode(message.data),
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
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // if (message.messageId != null && message.messageId == lastMessageId) {
      //   return;
      // }
      // lastMessageId = message.messageId;
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');
      notificationClicked(message.data);
    });
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) async {
      if (message == null) return;
      if (kDebugMode) {
        print(
            "on-tap notification in case of app closed > terminated & background(back-button)");
      }
      print('Message data: ${message.data}');
      notificationClicked(message.data);
    });
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }

  ///Doesn't play a notification(banner, ring, and vibrate) if the current screen is the chat screen AND chatting with the same user.

  static preventShowingNotification(RemoteMessage remoteMessage) {
    if (!ChatDetailsController.isPut) {
      return false;
    }
    final data = remoteMessage.data;
    if (!data.containsKey('details')) {
      return false;
    }
    final details = json.decode(data['details']);
    if (!details.containsKey('model')) {
      return false;
    }
    final String? model = details['model'];
    if (model != 'chat') return false;
    final chatId = details['id'];
    final currentActiveChatId = ChatDetailsController.to.chatId.value;
    return ('$chatId' == '$currentActiveChatId' &&
        Get.currentRoute == '/ChatScreen');
  }

  static notificationAction(RemoteMessage remoteMessage) {
    final data = remoteMessage.data;
    if (!data.containsKey('details')) {
      return;
    }
    final details = json.decode(data['details']);
    if (!details.containsKey('model')) {
      return;
    }
    final String? model = details['model'];
    // notification chat action
    if (model == 'chat') {
      try {
        final messageBody = json.decode(data['body']);
        chat.Message message = chat.Message.fromJson(messageBody);
        final chatId = num.tryParse('${details['id']}') ?? 0;
        HomeChatController.to.updateLastMessage(chatId, message);
        if (!ChatDetailsController.isPut) {
          return;
        }
        if (ChatDetailsController.to.chatId.value == chatId) {
          ChatDetailsController.to
              .appendMessage(chatId, message..isMine = false);
        }
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
  }

  static notificationClicked(Map remoteData) async {
    final data = remoteData;
    print('sadasdasd');
    print(data);
    if (!data.containsKey('details')) {
      return;
    }
    final details = json.decode(data['details']);
    if (!details.containsKey('model')) {
      return;
    }
    final String? model = details['model'];
    // notification chat action
    if (model == 'chat') {
      final context = Get.context;
      final messageBody = json.decode(data['body']);
      chat.Message message = chat.Message.fromJson(messageBody);
      final chatId = num.tryParse('${details['id']}') ?? 0;
      Get.to(() => ChatScreen(
            comeFrom: context?.localizations.chat ?? '',
            chatId: chatId,
            otherUser: message.client,
            post: PostModel.fromJson(messageBody['post']),
            store: '${messageBody['client']['type']}' == '1'
                ? Store.fromJson(messageBody['store'])
                : null,
            // post: message.post,
          ));
    }
  }

  static Future<void> getToken() async {
    await FirebaseMessaging.instance.getToken().then((value) {
      SharedPrefController().fcmToken = value;
      debugPrint("Token device📲=>  $value ");
    });
  }
}
