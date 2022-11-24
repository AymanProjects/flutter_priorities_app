import 'package:priorities/presentation/views/priority/providers/currently_viewed_priority.dart';
import 'package:priorities/presentation/views/priority/providers/emoji_keyboard_visiblity.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/cupertino.dart';

final prioritiesViewModelFormKeyProvider = AutoDisposeProvider(
  (ref) => GlobalKey<FormState>(),
);

final priorityViewModelProvider = Provider.autoDispose(
  (ref) => _PriorityViewModel(ref),
);

class _PriorityViewModel {
  final Ref ref;
  final textKeyboardNode = FocusNode();
  late final TextEditingController titleController;

  _PriorityViewModel(this.ref) {
    textKeyboardNode.addListener(() {
      if (textKeyboardNode.hasFocus) {
        closeEmojiKeyboard();
      }
    });
    titleController = TextEditingController(
        text: ref.read(currentlyViewedPriorityProvider).value?.title);
  }

  bool get isEditingMode =>
      ref.read(currentlyViewedPriorityProvider).value?.id != null;

  void onCreateOrConfirmButtonPressed() async {
    final key = ref.read(prioritiesViewModelFormKeyProvider);
    if (key.currentState?.validate() ?? false) {
      closeKeyboard();
      ref
          .read(currentlyViewedPriorityProvider.notifier)
          .createOrUpdatePriority();
    }
  }

  void onEmojiIconPressed() async {
    closeKeyboard();
    await Future.delayed(const Duration(milliseconds: 250));
    openEmojiKeyboard();
  }

  void closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void onEmojiSelected(_, Emoji emoji) {
    changeSelectedEmoji(emoji.emoji);
    closeEmojiKeyboard();
  }

  void onTitlechanged(String title) {
    ref.read(currentlyViewedPriorityProvider.notifier).setPriority(
          (priority) => priority.copyWith(title: titleController.text),
        );
  }

  void changeSelectedColor(int index) {
    ref.read(currentlyViewedPriorityProvider.notifier).setPriority(
          (priority) => priority.copyWith(colorId: index),
        );
  }

  void changeSelectedEmoji(String emoji) {
    ref.read(currentlyViewedPriorityProvider.notifier).setPriority(
          (priority) => priority.copyWith(emoji: emoji),
        );
  }

  void closeEmojiKeyboard() {
    ref.read(emojiKeyboardVisibilityProvider.notifier).closeEmojiKeyboard();
  }

  void openEmojiKeyboard() {
    ref.read(emojiKeyboardVisibilityProvider.notifier).openEmojiKeyboard();
  }

  String? titleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Title must be provided';
    }
    return null;
  }
}
