import 'package:flutter/material.dart';
import 'package:priorities/models/priority.dart';
import 'package:priorities/utils/constants.dart';
import 'package:priorities/views/home/components/priority_block/components/block_emoji.dart';
import 'package:priorities/views/home/components/priority_block/components/block_progress.dart';
import 'package:priorities/views/home/components/priority_block/components/list_fader.dart';
import 'package:priorities/views/home/components/priority_block/components/block_tasks_list.dart';
import 'package:priorities/views/home/components/priority_block/components/block_title.dart';

class PriorityBlock extends StatelessWidget {
  final Priority priority;

  const PriorityBlock(
    this.priority, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kMdPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kBorderRadius),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            priority.color,
            priority.color.withOpacity(0.85),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlockEmoji(priority.emoji),
              BlockProgress(priority.progress),
            ],
          ),
          const SizedBox(height: kMdPadding),
          BlockTitle(priority.title),
          Expanded(
            child: ListFader(
              child: BlockTasksList(priority.tasks),
              endColor: priority.color,
            ),
          ),
        ],
      ),
    );
  }
}
