// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter_riverpod/flutter_riverpod.dart';

extension AsyncNotifierExtensions<T> on AsyncNotifier<T> {
  Future<void> runLoadingOperation(Future<void> Function() operation) async {
    state = AsyncLoading<T>();
    try {
      await operation();
    } catch (e, st) {
      state = AsyncError<T>(e, st).copyWithPrevious(state);
    }
  }
}
