import 'package:priorities/data/repositories/priorities_repo.dart';
import 'package:priorities/injection.dart';
import 'package:priorities/presentation/views/home/components/priority_block/components/block_emoji.dart';
import 'package:priorities/presentation/views/home/components/priority_block/components/block_progress.dart';
import 'package:priorities/presentation/views/home/components/priority_block/components/block_tasks_list.dart';
import 'package:priorities/presentation/views/home/components/priority_block/components/block_title.dart';
import 'package:priorities/presentation/__components/bottom_fader.dart';
import 'package:priorities/data/constants/ui_constants.dart';
import 'package:priorities/data/models/priority.dart';
import 'package:priorities/data/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:priorities/presentation/views/home/home_view_model.dart';
import 'package:stacked/stacked.dart';

class PriorityBlock extends ViewModelWidget<HomeViewModel> {
  final Priority priority;

  const PriorityBlock(
    this.priority, {
    super.key,
  });

  @override
  Widget build(BuildContext context, viewModel) {
    //TODO delete GestureDetector
    return GestureDetector(
      onTap: () {
        locator<PrioritiesRepository>().deleteAll();
        viewModel.notifyListeners();
      },
      child: Container(
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
                    BlockEmoji(priority.emoji ?? Priority.defaultEmoji),
                    BlockProgress(priority.progress),
                  ],
                ),
                const SizedBox(height: kMdPadding),
                BlockTitle(priority.title ?? Priority.defaultTitle),
                Expanded(
                  child: BlockTasksList(priority.tasks ?? []),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
