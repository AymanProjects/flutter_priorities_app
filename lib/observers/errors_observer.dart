import 'package:priorities/providers/service_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// The observer will listen for every change in all providers.
// Here, we will check if a newValue is of type error, then display the error
// using the notifications service.
class ErrorsObserver extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    container.read(snackBackSerivceProvider).showError(newValue.toString());
    if (newValue is AsyncError) {
      container
          .read(snackBackSerivceProvider)
          .showError(newValue.error.toString());
    }
  }

  @override
  void didAddProvider(
      ProviderBase provider, Object? value, ProviderContainer container) {
    container.read(snackBackSerivceProvider).showError(value.toString());
  }
}
