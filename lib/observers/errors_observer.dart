import 'package:priorities/services/snackbar_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:priorities/injection.dart';

// TODO: remove locator

// The observer will listen for every change in all providers.
// Here, we will check if a newValue is of type error, then display the error
// using the notifications service.
class ErrorsObserver extends ProviderObserver {
  final snackbarService = locator<SnackBarService>();

  @override
  void didUpdateProvider(ProviderBase provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    if (newValue is AsyncError) {
      snackbarService.showError(newValue.error.toString());
    }
  }
}
