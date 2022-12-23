import 'package:priorities/presentation/views/priority/providers/currently_viewed_priority.dart';
import 'package:priorities/presentation/views/priority/providers/emoji_keyboard_visiblity.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class EmojiKeyboard extends ConsumerWidget {
  const EmojiKeyboard({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isKeyboardVisible = ref.watch(emojiKeyboardVisibility);
    return Offstage(
      offstage: !isKeyboardVisible,
      child: WillPopScope(
        onWillPop: () => onBackButtonPressed(isKeyboardVisible, ref),
        child: SizedBox(
          height: 280,
          child: EmojiPicker(
            onEmojiSelected: (_, emoji) => onEmojiSelected(emoji, ref),
          ),
        ),
      ),
    );
  }

  Future<bool> onBackButtonPressed(
    bool isKeyboardVisible,
    WidgetRef ref,
  ) async {
    if (isKeyboardVisible) {
      ref.read(emojiKeyboardVisibility.notifier).closeEmojiKeyboard();
      return false;
    }
    return true;
  }

  void onEmojiSelected(Emoji emoji, WidgetRef ref) {
    ref.read(currentlyViewedPriority.notifier).updateState(
          (priority) => priority.copyWith(emoji: emoji.emoji),
        );
    ref.read(emojiKeyboardVisibility.notifier).closeEmojiKeyboard();
  }
}
