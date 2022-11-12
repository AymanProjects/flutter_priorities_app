import 'package:priorities/presentation/views/priority/priority_view_model.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class EmojiKeyboard extends ViewModelWidget<PriorityViewModel> {
  const EmojiKeyboard({super.key});

  @override
  Widget build(BuildContext context, viewModel) {
    return Offstage(
      offstage: !viewModel.isEmojiKeyboardShowing,
      child: WillPopScope(
        onWillPop: () async {
          if (viewModel.isEmojiKeyboardShowing) {
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
