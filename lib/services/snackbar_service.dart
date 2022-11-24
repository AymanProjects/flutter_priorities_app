import 'package:flutter/material.dart';

/// A service for showing snackbar messages to the user.
///
/// Put the `messengerKey` inside the MaterialApp.
///

class SnackBarService {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();
  const SnackBarService();

  void showError(String error) {
    final snack = SnackBar(
      content: Text(error),
      elevation: 0,
      backgroundColor: Colors.redAccent,
    );
    messengerKey.currentState?.showSnackBar(snack);
  }
}
