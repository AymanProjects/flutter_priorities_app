import 'package:priorities/presentation/views/home/components/priorities_grid/components/empty_priorities_grid.dart';
import 'package:priorities/presentation/views/home/components/priorities_grid/components/priority_block/priority_block_view.dart';
import 'package:priorities/presentation/__components/centered_loading_indicator.dart';
import 'package:priorities/presentation/views/home/home_view_model.dart';
import 'package:priorities/data/constants/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PrioritiesGrid extends ViewModelWidget<HomeViewModel> {
  const PrioritiesGrid({super.key});

  @override
  Widget build(BuildContext context, viewModel) {
    final priorities = viewModel.priorities;
    return viewModel.busy(priorities)
        ? const CenteredLoadingIndicator()
        : priorities.isEmpty
            ? const EmptyPrioritiesGrid()
            : GridView.count(
                childAspectRatio: kLgBlockAspectRatio,
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: kLgPadding,
                crossAxisSpacing: kLgPadding,
                padding: const EdgeInsets.symmetric(vertical: kSmPadding),
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                children: priorities
                    .map((priority) => PriorityBlockView(priority))
                    .toList(),
              );
  }
}
