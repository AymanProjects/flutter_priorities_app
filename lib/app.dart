import 'package:priorities/data/constants/theme.dart';
import 'package:priorities/presentation/views/home/home_view.dart';
import 'package:priorities/services/app_router.dart';
import 'package:priorities/services/notifier.dart';
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

    return MaterialApp(
      title: 'Priorities',
      color: kAppColor,
      theme: kLightTheme,
      debugShowCheckedModeBanner: false,
      navigatorKey: AppRouter.navigatorKey,
      scaffoldMessengerKey: Notifier.messengerKey,
      home: Scaffold(
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (scroll) {
            scroll.disallowIndicator();
            return true;
          },
          child: const HomeView(),
        ),
      ),
    );
  }
}
