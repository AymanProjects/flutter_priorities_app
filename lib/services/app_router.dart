import 'package:flutter/material.dart';

/// A service for navigating between pages in the app.
///
/// Put the `AppRouter.navigationKey` inside the MaterialApp.
///

class AppRouter {
  static final navigatorKey = GlobalKey<NavigatorState>();
  const AppRouter();

  Future<T?>? openPage<T>(Widget view) {
    return navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (context) => view,
      ),
    );
  }

  void closeCurrentPage() {
    navigatorKey.currentState?.pop();
  }
}
