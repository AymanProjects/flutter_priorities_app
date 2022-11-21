import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:priorities/injection.dart';
import 'package:priorities/services/notifications_service.dart';

class ErrorsObserver extends ProviderObserver {
  final notificationsService = locator<NotificationsService>();
  // The observer will listen for every change in all providers.
  // Here, we will check if a newValue is of type error, then display the error
  // using the notifications service.
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    if (newValue is AsyncError) {
      notificationsService.showError(newValue.error.toString());
    }
  }
}
