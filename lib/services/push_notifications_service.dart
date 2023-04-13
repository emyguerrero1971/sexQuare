// https://developers.google.com/oauthplayground
// SHA1   - 7d:f0:d6:ea:8d:ee:b8:cc:f4:01:34:a0:06:86:84:5c:ca:7e:4a:79
// token  - dWCGRrrkQq-cvaOwYLscsr:APA91bFD9Nk79m_YaCgXxuuQl2S6-J-nc8jp_5ZhA62Y953YgJE4WVnn-HKRt7OmYQgRnqTXmIBQiibEjvBhlO7vD7ht1MuSABOPExHtZg1Mw4f7y9F7VhvBArB3byudkB9khCjMUQMN

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:sexquare/share_preferences/preferences.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static final StreamController<String> _messageStream =
      StreamController();
  static Stream<String> get messagesStream => _messageStream.stream;

  static Future _backgroundHandler(RemoteMessage message) async {
    _messageStream.add(message.data['producto'] ?? 'No-data');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    _messageStream.add(message.data['producto'] ?? 'No-data');
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    _messageStream.add(message.data['producto'] ?? 'No-data');
  }

  static Future initializeApp() async {
    // Push Notification
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    Preferences.tokenDispositivoId = token!;
    
    // Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);

    // Local Notification
  }

  static closeStreams() {
    _messageStream.close();
  }
}
