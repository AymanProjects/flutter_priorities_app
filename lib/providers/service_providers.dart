import 'package:priorities/services/navigation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:priorities/services/snackbar_service.dart';
import 'package:priorities/services/user_prefs_service.dart';

final navigationServiceProvider = Provider(
  (ref) => const NavigationService(),
);

final snackBackSerivceProvider = Provider(
  (ref) => const SnackBarService(),
);

final userPrefSerivceProvider = Provider(
  (ref) => const UserPrefsService(),
);
