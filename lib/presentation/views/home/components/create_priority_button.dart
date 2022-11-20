import 'package:priorities/presentation/views/home/home_view_model.dart';
import 'package:priorities/presentation/__components/horizon_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CreatePriorityButton extends ViewModelWidget<HomeViewModel> {
  const CreatePriorityButton({super.key});

  @override
  bool get reactive => false;

  @override
  Widget build(BuildContext context, viewModel) {
    return HorizonButton(
      onPressed: viewModel.createPriorityButtonOnTap,
      icon: Icons.add_rounded,
      width: double.infinity,
      iconSize: 32.0,
    );
  }
}