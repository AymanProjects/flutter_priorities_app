import 'package:priorities/presentation/views/home/components/priorities_grid/components/priority_block/components/block_emoji.dart';
import 'package:priorities/presentation/views/home/components/priorities_grid/components/priority_block/components/block_progress.dart';
import 'package:priorities/presentation/views/home/components/priorities_grid/components/priority_block/components/block_tasks_list.dart';
import 'package:priorities/presentation/views/home/components/priorities_grid/components/priority_block/components/block_title.dart';
import 'package:priorities/presentation/__components/medium_padding.dart';
import 'package:priorities/presentation/__components/small_padding.dart';
import 'package:priorities/presentation/__components/bottom_fader.dart';
import 'package:priorities/data/constants/ui_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:priorities/data/models/priority.dart';
import 'package:flutter/material.dart';
import 'package:priorities/presentation/views/priority/priority_view.dart';
import 'package:priorities/presentation/views/priority/providers/currently_viewed_priority.dart';
import 'package:priorities/providers/service_providers.dart';

class PriorityBlockView extends ConsumerWidget {
  final Priority priority;
  const PriorityBlockView(this.priority, {super.key});

  @override
  Widget build(BuildContext context, ref) {
    return GestureDetector(
      onTap: () => priorityBlockOnTap(ref),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kBorderRadius),
          color: priority.color,
        ),
        child: BottomFader(
          child: Padding(
            padding: const EdgeInsets.all(kMdPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlockEmoji(priority.emoji),
                    const SmallPadding(),
                    BlockProgress(priority.tasks),
                  ],
                ),
                const MediumPadding(),
                BlockTitle(priority.title),
                Expanded(
                  child: BlockTasksList(priority.tasks),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void priorityBlockOnTap(WidgetRef ref) async {
    ref.read(currentlyViewedPriority.notifier).updateState((_) => priority);
    ref.read(navigationServiceProvider).openPage(const PriorityView());
  }
}
