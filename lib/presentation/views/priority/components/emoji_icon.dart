import 'package:priorities/presentation/views/priority/providers/currently_viewed_priority.dart';
import 'package:priorities/presentation/__components/horizon_icon_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:priorities/presentation/views/priority/providers/emoji_keyboard_visiblity.dart';
import 'package:priorities/presentation/views/priority/providers/group_focus_node_provider.dart';

class PriorityViewEmojiIcon extends ConsumerWidget {
  const PriorityViewEmojiIcon({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final emoji = ref.watch(currentlyViewedPriority.select(
      (value) => value.valueOrNull?.emoji,
    ));
    return HorizonThinButton(
      onPressed: () => onEmojiIconPressed(ref),
      text: emoji,
      textSize: 24.0,
    );
  }

  void onEmojiIconPressed(WidgetRef ref) async {
    ref.read(priorityViewGroupFocusNode).unfocus();
    await Future.delayed(const Duration(milliseconds: 250));
    ref.read(emojiKeyboardVisibility.notifier).openEmojiKeyboard();
  }
}
