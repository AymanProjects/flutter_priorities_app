import 'package:priorities/presentation/views/home/home_view.dart';
import 'package:priorities/observers/errors_observer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:priorities/services/notifications_service.dart';
import 'package:priorities/data/constants/theme.dart';
import 'package:priorities/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (scroll) {
        scroll.disallowIndicator();
        return true;
      },
      child: ProviderScope(
        observers: [ErrorsObserver()],
        child: MaterialApp(
          title: 'Priorities',
          color: kAppColor,
          theme: kLightTheme,
          debugShowCheckedModeBanner: false,
          navigatorKey: NavigationService.navigatorKey,
          scaffoldMessengerKey: NotificationsService.messengerKey,
          home: const Scaffold(
            body: HomeView(),
          ),
        ),
      ),
    );
  }
}
