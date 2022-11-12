import 'package:priorities/presentation/views/priority/priority_view_model.dart';
import 'package:priorities/presentation/__components/horizon_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PriorityViewEmoji extends ViewModelWidget<PriorityViewModel> {
  const PriorityViewEmoji({super.key});

  @override
  Widget build(BuildContext context, viewModel) {
    return HorizonThinButton(
      onPressed: viewModel.onEmojiIconPressed,
      text: viewModel.selectedEmoji,
      textSize: 24.0,
    );
  }
}
