import 'package:flutter/material.dart';
import 'package:priorities/domain/base/view.dart';

class AppRouter {
  static final _this = AppRouter._();
  static final navigatorKey = GlobalKey<NavigatorState>();

  AppRouter._();
  factory AppRouter() => _this;

  Future<Object?>? open(View view) {
    return navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (context) => view,
      ),
    );
  }

  void close() {
    navigatorKey.currentState?.pop();
  }
}
