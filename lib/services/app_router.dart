import 'package:priorities/presentation/__components/horizon_button.dart';
import 'package:priorities/data/constants/ui_constants.dart';
import 'package:flutter/material.dart';

/// A service for navigating between pages in the app.
///
/// Put the `AppRouter.navigationKey` inside the MaterialApp.
///

class AppRouter {
  static final navigatorKey = GlobalKey<NavigatorState>();
  const AppRouter();

  Future<T?>? openPage<T>(Widget page) {
    return navigatorKey.currentState?.push<T>(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  void closeCurrentPage<T>([T? result]) {
    navigatorKey.currentState?.pop(result);
  }

  Future<T?> openModal<T>(Widget modal) {
    return showModalBottomSheet<T>(
      context: navigatorKey.currentContext!,
      builder: (context) => modal,
    );
  }

  Future<String?> openTextFieldDialog(String title, String hint,
      {bool dismissable = true}) async {
    String? result;
    final focusNode = FocusNode();
    focusNode.requestFocus();
    await showDialog(
      context: navigatorKey.currentContext!,
      barrierDismissible: dismissable,
      builder: (context) => Dialog(
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                focusNode: focusNode,
                decoration: InputDecoration(
                  hintText: hint,
                  border: InputBorder.none,
                ),
                onChanged: (value) => result = value,
              ),
              const SizedBox(height: 12.0),
              HorizonButton(
                text: 'Done',
                onPressed: closeCurrentPage,
              ),
            ],
          ),
        ),
      ),
    );
    focusNode.dispose();
    return result;
  }

  // void openEmojiKeyboard() {
  //   final viewInsets = EdgeInsets.fromWindowPadding(
  //     WidgetsBinding.instance.window.viewInsets,
  //     WidgetsBinding.instance.window.devicePixelRatio,
  //   );

  //   navigatorKey.currentState?.push(
  //     MaterialPageRoute(
  //       builder: (context) {
  //         return
  //       },
  //     ),
  //   );
  // }
}
