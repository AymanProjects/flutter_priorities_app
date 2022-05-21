import 'package:flutter/material.dart';
import 'package:priorities/views/components/horizon_button.dart';
import 'package:priorities/views/home/home_view_model.dart';
import 'package:stacked/stacked.dart';

class NewPriorityButton extends ViewModelWidget<HomeViewModel> {
  const NewPriorityButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    return HorizonButton(
      onTap: () => viewModel.createNewPriority(context),
      icon: Icons.add_rounded,
    );
  }
}
