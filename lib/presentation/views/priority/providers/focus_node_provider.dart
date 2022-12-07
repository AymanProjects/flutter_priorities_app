import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/cupertino.dart';

final priorityViewFocusNode =
    AutoDisposeNotifierProvider<_FocusNodeNotifier, FocusNode>(
  () => _FocusNodeNotifier(),
);

class _FocusNodeNotifier extends AutoDisposeNotifier<FocusNode> {
  @override
  FocusNode build() {
    final node = FocusNode();
    ref.onDispose(() => node.dispose());
    node.addListener(() {
      ref.notifyListeners();
    });
    return node;
  }
}
