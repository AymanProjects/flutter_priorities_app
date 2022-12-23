import 'package:priorities/presentation/views/priority/providers/currently_viewed_priority.dart';
import 'package:priorities/data/constants/ui_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class PriorityColors extends ConsumerWidget {
  const PriorityColors({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final selectedColorId = ref.watch(currentlyViewedPriority.select(
      (value) => value.valueOrNull?.colorId,
    ));
    return ListView.builder(
      itemCount: kCardColors.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final isSelected = selectedColorId == index;
        return ChoiceChip(
          pressElevation: 0,
          shape: CircleBorder(
            side: BorderSide(
              color: isSelected ? Colors.black : Colors.transparent,
              width: 2.0,
            ),
          ),
          backgroundColor: kCardColors[index],
          selectedColor: kCardColors[index],
          selected: true,
          padding: EdgeInsets.zero,
          labelPadding: EdgeInsets.zero,
          label: const SizedBox(width: 30.0),
          onSelected: (_) => changeSelectedColor(index, ref),
        );
      },
    );
  }

  void changeSelectedColor(int index, WidgetRef ref) {
    ref.read(currentlyViewedPriority.notifier).updateState(
          (priority) => priority.copyWith(colorId: index),
        );
  }
}
