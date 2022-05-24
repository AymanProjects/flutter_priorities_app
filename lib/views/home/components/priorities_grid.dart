import 'package:flutter/material.dart';
import 'package:priorities/utils/constants.dart';
import 'package:priorities/views/home/components/empty_priorities_grid.dart';
import 'package:priorities/views/home/components/priority_block/priority_block.dart';
import 'package:priorities/views/home/home_view_model.dart';
import 'package:stacked/stacked.dart';

class PrioritiesGrid extends ViewModelWidget<HomeViewModel> {
  const PrioritiesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    return viewModel.hasPriorities
        ? GridView.count(
            childAspectRatio: viewModel.gridBlocksSize,
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: kLgPadding,
            crossAxisSpacing: kLgPadding,
            padding: const EdgeInsets.symmetric(vertical: kSmPadding),
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            children: viewModel.priorities
                .map((priority) => PriorityBlock(priority))
                .toList(),
          )
        : const EmptyPrioritiesGrid();
  }
}
