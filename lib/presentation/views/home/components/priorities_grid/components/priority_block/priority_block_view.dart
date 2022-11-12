// ignore_for_file: avoid_renaming_method_parameters
import 'package:priorities/presentation/__components/small_padding.dart';
import 'package:priorities/presentation/views/home/components/priorities_grid/components/priority_block/priority_block_viewmodel.dart';
import 'package:priorities/presentation/views/home/components/priorities_grid/components/priority_block/components/block_emoji.dart';
import 'package:priorities/presentation/views/home/components/priorities_grid/components/priority_block/components/block_progress.dart';
import 'package:priorities/presentation/views/home/components/priorities_grid/components/priority_block/components/block_tasks_list.dart';
import 'package:priorities/presentation/views/home/components/priorities_grid/components/priority_block/components/block_title.dart';
import 'package:priorities/presentation/__components/medium_padding.dart';
import 'package:priorities/presentation/views/home/home_view_model.dart';
import 'package:priorities/presentation/__components/bottom_fader.dart';
import 'package:priorities/data/constants/ui_constants.dart';
import 'package:priorities/data/models/priority.dart';
import 'package:priorities/data/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PriorityBlockView extends ViewModelWidget<HomeViewModel> {
  final Priority priority;

  const PriorityBlockView(
    this.priority, {
    super.key,
  });

  @override
  Widget build(BuildContext context, homeViewModel) {
    return ViewModelBuilder<PriorityBlockViewModel>.nonReactive(
      viewModelBuilder: () => PriorityBlockViewModel(priority),
      builder: (context, viewModel, _) {
        return GestureDetector(
          onTap: () => homeViewModel.priorityBlockOnTap(priority),
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
                        BlockEmoji(priority.emoji),
                        const SmallPadding(),
                        BlockProgress(viewModel.getProgress()),
                      ],
                    ),
                    const MediumPadding(),
                    BlockTitle(priority.title),
                    Expanded(
                      child: BlockTasksList(viewModel.tasks),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
