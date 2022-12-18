import 'package:priorities/presentation/__components/medium_padding.dart';
import 'package:priorities/presentation/views/priority/components/cancel_button.dart';
import 'package:priorities/presentation/views/priority/components/create_or_confirm_button.dart';
import 'package:priorities/presentation/views/priority/providers/currently_viewed_priority.dart';
import 'package:priorities/presentation/views/priority/components/priority_colors.dart';
import 'package:priorities/presentation/views/priority/components/title_textfield.dart';
import 'package:priorities/presentation/views/priority/components/emoji_keyboard.dart';
import 'package:priorities/presentation/views/priority/components/tasks_header.dart';
import 'package:priorities/presentation/views/priority/components/emoji_icon.dart';
import 'package:priorities/presentation/views/priority/providers/form_key.dart';
import 'package:priorities/presentation/__components/small_padding.dart';
import 'package:priorities/presentation/__components/large_padding.dart';
import 'package:priorities/presentation/__components/view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class PriorityView extends ConsumerWidget {
  const PriorityView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final formKey = ref.watch(priorityViewFormKey);
    final viewedPriority = ref.read(currentlyViewedPriority.notifier);
    return Column(
      children: [
        Expanded(
          child: View(
            title: viewedPriority.isInEditingMode
                ? 'Edit Priority'
                : 'New Priority',
            trailing: const PriorityColors(),
            children: [
              Form(
                key: formKey,
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
              const MediumPadding(),
              const CancelButton(),
              const LargePadding(),
            ],
          ),
        ),
        const EmojiKeyboard(),
      ],
    );
  }
}
