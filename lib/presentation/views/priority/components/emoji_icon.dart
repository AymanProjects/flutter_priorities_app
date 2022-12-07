import 'package:priorities/presentation/views/priority/providers/currently_viewed_priority.dart';
import 'package:priorities/presentation/__components/horizon_icon_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:priorities/presentation/views/priority/providers/emoji_keyboard_visiblity.dart';

class PriorityViewEmojiIcon extends ConsumerWidget {
  const PriorityViewEmojiIcon({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final priority = ref.watch(currentlyViewedPriority);
    return HorizonThinButton(
      onPressed: () => onEmojiIconPressed(ref),
      text: priority.valueOrNull?.emoji,
      textSize: 24.0,
    );
  }

  void onEmojiIconPressed(WidgetRef ref) async {
    FocusManager.instance.primaryFocus?.unfocus(); // closes keyboard
    await Future.delayed(const Duration(milliseconds: 250));
    ref.read(emojiKeyboardVisibility.notifier).openEmojiKeyboard();
  }
}
