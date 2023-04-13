import 'package:flutter/material.dart';

import 'package:sexquare/themes/app_theme.dart';

class SnackbarGlobal {
  static GlobalKey<ScaffoldMessengerState> key =
      GlobalKey<ScaffoldMessengerState>();

  static void show(String message) {
    key.currentState!
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        backgroundColor: AppTheme.primaryColorApp,
        content: Text(message)
      ));
  }
}

class MessageUtils {
  static final MessageUtils _instance = MessageUtils._internal();

  factory MessageUtils() {
    return _instance;
  }

  MessageUtils._internal();

  void showSnackBarText(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String message, int seconds) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: seconds),
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
