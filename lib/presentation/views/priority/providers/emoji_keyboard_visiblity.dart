import 'package:priorities/presentation/views/priority/providers/focus_node_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final emojiKeyboardVisibility =
    AutoDisposeNotifierProvider<_EmojiKeyboardVisibilityNotifier, bool>(
  () => _EmojiKeyboardVisibilityNotifier(),
);

class _EmojiKeyboardVisibilityNotifier extends AutoDisposeNotifier<bool> {
  @override
  bool build() {
    final focusNode = ref.watch(priorityViewFocusNode);
    if (focusNode.hasFocus) {
      closeEmojiKeyboard();
    }
    return false;
  }

  void closeEmojiKeyboard() {
    state = false;
  }

  void openEmojiKeyboard() {
    state = true;
  }
}
