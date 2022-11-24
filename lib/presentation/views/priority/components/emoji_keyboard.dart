import 'package:priorities/presentation/views/priority/providers/emoji_keyboard_visiblity.dart';
import 'package:priorities/presentation/views/priority/priority_view_model.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class EmojiKeyboard extends ConsumerWidget {
  const EmojiKeyboard({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final viewModel = ref.read(priorityViewModelProvider);
    final isKeyboardVisible = ref.watch(emojiKeyboardVisibilityProvider);
    return Offstage(
      offstage: !isKeyboardVisible,
      child: WillPopScope(
        onWillPop: () async {
          if (isKeyboardVisible) {
            viewModel.closeEmojiKeyboard();
            return false;
          }
          return true;
        },
        child: SizedBox(
          height: 280,
          child: EmojiPicker(
            onEmojiSelected: viewModel.onEmojiSelected,
          ),
        ),
      ),
    );
  }
}
