import 'package:priorities/presentation/views/priority/components/create_or_confirm_button.dart';
import 'package:priorities/presentation/views/priority/components/emoji_keyboard.dart';
import 'package:priorities/presentation/views/priority/components/priority_colors.dart';
import 'package:priorities/presentation/views/priority/components/title_textfield.dart';
import 'package:priorities/presentation/views/priority/components/tasks_header.dart';
import 'package:priorities/presentation/views/priority/components/emoji_icon.dart';
import 'package:priorities/presentation/views/priority/priority_view_model.dart';
import 'package:priorities/presentation/__components/small_padding.dart';
import 'package:priorities/presentation/__components/large_padding.dart';
import 'package:priorities/presentation/__components/view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class PriorityView extends ConsumerWidget {
  const PriorityView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final viewModel = ref.read(priorityViewModelProvider);
    return Column(
      children: [
        Expanded(
          child: View(
            title: viewModel.isEditingMode ? 'Edit Priority' : 'New Priority',
            trailing: const PriorityColors(),
            children: [
              Form(
                key: ref.read(prioritiesViewModelFormKeyProvider),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    PriorityViewEmojiIcon(),
                    SmallPadding(),
                    TitleTextField(),
                    SmallPadding(),
                    TasksHeader(),
                  ],
                ),
              ),
              const Spacer(),
              const CreateOrConfirmButton(),
              const LargePadding(),
            ],
          ),
        ),
        const EmojiKeyboard(),
      ],
    );
  }
}
