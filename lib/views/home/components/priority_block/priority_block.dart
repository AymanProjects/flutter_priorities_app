import 'package:flutter/material.dart';
import 'package:priorities/domain/entities/priority.dart';
import 'package:priorities/utils/constants.dart';
import 'package:priorities/utils/theme.dart';
import 'package:priorities/views/__components/bottom_fader.dart';
import 'package:priorities/views/home/components/priority_block/components/block_emoji.dart';
import 'package:priorities/views/home/components/priority_block/components/block_progress.dart';
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kBorderRadius),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            lightenColor(priority.color),
            priority.color,
            darkenColor(priority.color),
          ],
        ),
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
                  BlockProgress(priority.progress),
                ],
              ),
              const SizedBox(height: kMdPadding),
              BlockTitle(priority.title),
              Expanded(
                child: BlockTasksList(priority.tasks.toList()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
