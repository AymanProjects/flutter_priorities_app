import 'package:flutter/material.dart';

/// A service for showing snackbar messages to the user.
///
/// Put the `Notifier.messengerKey` inside the MaterialApp.
///

class Notifier {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();
  const Notifier();

  void show(String message) {
    final snack = SnackBar(content: Text(message.toString()));
    messengerKey.currentState?.showSnackBar(snack);
  }
}
