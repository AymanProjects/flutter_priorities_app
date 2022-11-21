import 'package:flutter/material.dart';

/// A service for showing snackbar messages to the user.
///
/// Put the `Notifier.messengerKey` inside the MaterialApp.
///

class NotificationsService {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();
  const NotificationsService();

  void showError(String error) {
    final snack = SnackBar(
      content: Text(error),
      elevation: 0,
      backgroundColor: Colors.redAccent,
    );
    messengerKey.currentState?.showSnackBar(snack);
  }
}
