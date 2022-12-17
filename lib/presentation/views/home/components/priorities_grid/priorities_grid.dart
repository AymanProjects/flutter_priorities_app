import 'package:priorities/presentation/views/home/components/priorities_grid/components/empty_priorities_grid.dart';
import 'package:priorities/presentation/views/home/components/priorities_grid/components/priority_block/priority_block_view.dart';
import 'package:priorities/presentation/views/home/providers/home_priorities_provider.dart';
import 'package:priorities/presentation/__components/centered_loading_indicator.dart';
import 'package:priorities/data/constants/ui_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class PrioritiesGrid extends ConsumerWidget {
  const PrioritiesGrid({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final priorities = ref.watch(homePrioritiesProvider);
    return priorities.when(
      skipError: true,
      loading: () => const CenteredLoadingIndicator(),
      error: (error, stackTrace) => const EmptyPrioritiesGrid(),
      data: (priorities) {
        return RefreshIndicator(
          onRefresh: () async => ref.refresh(homePrioritiesProvider.future),
          child: GridView.count(
            childAspectRatio: kLgBlockAspectRatio,
            // shrinkWrap: true,
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
          ),
        );
      },
    );
  }
}
