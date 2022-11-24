import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:priorities/presentation/__components/horizon_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:priorities/presentation/views/priority/priority_view_model.dart';
import 'package:priorities/presentation/views/priority/providers/currently_viewed_priority.dart';

class PriorityViewEmojiIcon extends ConsumerWidget {
  const PriorityViewEmojiIcon({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final viewModel = ref.read(priorityViewModelProvider);
    final priority = ref.watch(currentlyViewedPriorityProvider).valueOrNull;
    return HorizonThinButton(
      onPressed: viewModel.onEmojiIconPressed,
      text: priority?.emoji,
      textSize: 24.0,
    );
  }
}
