import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:vcamp/notifications/local_notification_service.dart';

handleForegroundNotification() {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (message.notification != null) {
      CloudNotification().showNotification(message);
    }
  });
}

requestNotificationPermission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  // if (message.notification != null) {
  //   CloudNotification().showNotification(message);
  // }
}

Future<void> setupInteractedMessage(bool isToNavigate) async {
  // Get any messages which caused the application to open from
  // a terminated state.
  RemoteMessage? initialMessage =
      await FirebaseMessaging.instance.getInitialMessage();

  // If the message also contains a data property with a "type" of "chat",
  // navigate to a chat screen
  if (initialMessage != null) {
//TODO handle this condition
    // if (!AppConstants.isInitialMessageHandled) {
    //   AppConstants.isInitialMessageHandled = true;
    //   _handleMessage(initialMessage);
    // }
  }

  // Also handle any interaction when the app is in the background via a
  // Stream listener
  FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
}

void _handleMessage(RemoteMessage message) {
  // CloudNotification().showNotification(message);
  navigateUserAsPerNotification(message.data);
}
