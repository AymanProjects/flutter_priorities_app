import 'package:flutter/material.dart';
import 'package:priorities/views/__components/horizon_button.dart';
import 'package:priorities/views/home/home_view_model.dart';
import 'package:stacked/stacked.dart';

class CreatePriorityButton extends ViewModelWidget<HomeViewModel> {
  const CreatePriorityButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    return HorizonButton(
      onTap: () => viewModel.createNewPriority(context),
      icon: Icons.add_rounded,
      width: double.infinity,
      iconSize: 32.0,
    );
  }
}
