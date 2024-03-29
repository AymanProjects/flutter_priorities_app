import 'package:priorities/presentation/views/home/home_view.dart';
import 'package:priorities/services/snackbar_service.dart';
import 'package:priorities/services/navigation_service.dart';
import 'package:priorities/data/constants/theme.dart';
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
      child: MaterialApp(
        title: 'Priorities',
        color: kAppColor,
        theme: kLightTheme,
        debugShowCheckedModeBanner: false,
        navigatorKey: NavigationService.navigatorKey,
        scaffoldMessengerKey: SnackBarService.messengerKey,
        home: const Scaffold(
          body: HomeView(),
        ),
      ),
    );
  }
}
