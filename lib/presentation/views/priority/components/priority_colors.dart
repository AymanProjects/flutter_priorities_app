import 'package:priorities/presentation/views/priority/priority_view_model.dart';
import 'package:priorities/data/constants/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PriorityColors extends ViewModelWidget<PriorityViewModel> {
  const PriorityColors({super.key});

  @override
  Widget build(BuildContext context, viewModel) {
    return ListView.builder(
      itemCount: kCardColors.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final isSelected = viewModel.selectedColor == index;
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
          onSelected: (_) => viewModel.setSelectedColor(index),
        );
      },
    );
  }
}
