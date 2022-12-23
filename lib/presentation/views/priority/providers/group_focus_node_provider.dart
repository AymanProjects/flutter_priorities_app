import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/cupertino.dart';

final priorityViewGroupFocusNode =
    AutoDisposeNotifierProvider<_TitleFocusNodeNotifier, FocusScopeNode>(
  () => _TitleFocusNodeNotifier(),
);

class _TitleFocusNodeNotifier extends AutoDisposeNotifier<FocusScopeNode> {
  @override
  FocusScopeNode build() {
    final node = FocusScopeNode();
    ref.onDispose(() => node.dispose());
    node.addListener(() {
      ref.notifyListeners();
    });
    return node;
  }
}
