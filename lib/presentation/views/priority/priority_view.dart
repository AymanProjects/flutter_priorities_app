import 'package:priorities/presentation/__components/large_padding.dart';
import 'package:priorities/presentation/__components/small_padding.dart';
import 'package:priorities/presentation/views/priority/components/tasks_header.dart';
import 'package:priorities/presentation/views/priority/components/emoji_icon.dart';
import 'package:priorities/presentation/views/priority/components/emoji_keyboard.dart';
import 'package:priorities/presentation/views/priority/components/priority_colors.dart';
import 'package:priorities/presentation/views/priority/components/title_textfield.dart';
import 'package:priorities/presentation/views/priority/priority_view_model.dart';
import 'package:priorities/presentation/__components/horizon_button.dart';
import 'package:priorities/presentation/__components/view.dart';
import 'package:priorities/data/models/priority.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

/// if the priority is not null, then the screen will be for editing, not creating.
class PriorityView extends StatelessWidget {
  final Priority? priority;

  const PriorityView(
    this.priority, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PriorityViewModel>.nonReactive(
      viewModelBuilder: () => PriorityViewModel(priority),
      onModelReady: (model) => model.init(),
      builder: (context, viewModel, child) {
        return Column(
          children: [
            Expanded(
              child: View(
                title:
                    viewModel.isEditingMode ? 'Edit Priority' : 'New Priority',
                trailing: const PriorityColors(),
                children: [
                  Form(
                    key: viewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        PriorityViewEmoji(),
                        SmallPadding(),
                        TitleTextField(),
                        SmallPadding(),
                        TasksHeader(),
                      ],
                    ),
                  ),
                  const Spacer(),
                  HorizonButton(
                    text: viewModel.isEditingMode ? 'Confirm' : 'Create',
                    isLoading: viewModel.isBusy,
                    onPressed: viewModel.onCreateOrConfirmButtonPressed,
                  ),
                  const LargePadding(),
                ],
              ),
            ),
            const EmojiKeyboard(),
          ],
        );
      },
    );
  }
}
