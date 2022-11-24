import 'package:flutter_riverpod/flutter_riverpod.dart';

final emojiKeyboardVisibilityProvider =
    AutoDisposeNotifierProvider<_EmojiKeyboardVisibilityNotifier, bool>(
  () => _EmojiKeyboardVisibilityNotifier(),
);

class _EmojiKeyboardVisibilityNotifier extends AutoDisposeNotifier<bool> {
  @override
  bool build() {
    return false;
  }

  void closeEmojiKeyboard() {
    state = false;
  }

  void openEmojiKeyboard() {
    state = true;
  }
}
