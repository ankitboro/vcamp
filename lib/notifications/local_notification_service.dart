import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vcamp/main.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class CloudNotification {
  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    importance: Importance.max,
    enableLights: true,

    enableVibration: true,
    playSound: true,
  );

  AndroidNotificationDetails androidPlatformChannelSpecifics =
      const AndroidNotificationDetails(
    "high_importance_channel",
    'High Importance Notifications',
    importance: Importance.max,
    priority: Priority.high,
    icon: "@drawable/notification_icon",
    playSound: true,
    enableVibration: true,
    showWhen: true,
  );
  DarwinNotificationDetails iosPlatformChannelSpecifics =
      const DarwinNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );

  createAndroidChannel() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  Future<String> downloadAndSaveFile(String url, String fileName) async {
    final Directory directory = await getTemporaryDirectory();
    final String filePath = '${directory.path}/$fileName';
    final http.Response response = await http.get(Uri.parse(url));
    final File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }

  Future<Uint8List> getByteArrayFromUrl(String url) async {
    final http.Response response = await http.get(Uri.parse(url));
    return response.bodyBytes;
  }

  showNotification(RemoteMessage message) async {
    String bigPicturePath = "";

    BigPictureStyleInformation? bigPictureStyleInformation;
    if ((message.data["image_url"] != null) ||
        (message.notification?.android?.imageUrl != null ||
            message.notification?.android?.smallIcon != null)) {
      // if () {
      // String path =
      String path = message.data['image_url'] ??
          message.notification?.android?.imageUrl ??
          message.notification!.android!.smallIcon!;
      bigPicturePath = await downloadAndSaveFile(path, '${DateTime.now()}.jpg');
      if (Platform.isAndroid) {
        final ByteArrayAndroidBitmap largeIcon =
            ByteArrayAndroidBitmap(await getByteArrayFromUrl('$path/48x48'));
        final ByteArrayAndroidBitmap bigPicture =
            ByteArrayAndroidBitmap(await getByteArrayFromUrl('$path/200x400'));
        bigPictureStyleInformation = BigPictureStyleInformation(
          bigPicture,
          largeIcon: largeIcon,
          hideExpandedLargeIcon: true,
          contentTitle: message.notification?.title,
          htmlFormatContentTitle: true,
          summaryText: message.notification?.body,
          htmlFormatSummaryText: true,
        );
        androidPlatformChannelSpecifics = AndroidNotificationDetails(
          "high_importance_channel",
          'notification',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
          enableVibration: true,
          largeIcon: FilePathAndroidBitmap(bigPicturePath),
          styleInformation: bigPictureStyleInformation,
          showWhen: true,
        );
      } else {
        iosPlatformChannelSpecifics = DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
          subtitle: message.data["title"],
          attachments: <DarwinNotificationAttachment>[
            DarwinNotificationAttachment(
              bigPicturePath,
              hideThumbnail: true,
            )
          ],
        );
      }
    }

    flutterLocalNotificationsPlugin.show(
      DateTime.now().millisecond,
      message.notification?.title,
      message.notification?.body,
      payload: jsonEncode(message.data),
      NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iosPlatformChannelSpecifics,
      ),
    );
  }
}

initializeLocalNotifications() async {
  // await FirebaseMessaging.instance
  //     .setForegroundNotificationPresentationOptions(
  //   alert: true, // Required to display a heads up notification
  //   badge: true,
  //   sound: true,
  // );
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  DarwinInitializationSettings initializationSettingsIOS =
      const DarwinInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
  );

  InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );
  // // await flutterLocalNotificationsPlugin
  // //     .resolvePlatformSpecificImplementation<
  // //         IOSFlutterLocalNotificationsPlugin>()
  // //     ?.requestPermissions(
  // //       alert: true,
  // //       badge: true,
  // //       sound: true,
  // //     );

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveBackgroundNotificationResponse: selectNotification,
    onDidReceiveNotificationResponse: selectNotification,
  );
}

Future<void> selectNotification(NotificationResponse? response) async {
  try {
    dynamic data = jsonDecode(response?.payload ?? "{}");
    navigateUserAsPerNotification(data);
  } catch (e) {
    debugPrint(e.toString());
  }
}

navigateUserAsPerNotification(dynamic data) {
  //TODO: handle navigation here
}
