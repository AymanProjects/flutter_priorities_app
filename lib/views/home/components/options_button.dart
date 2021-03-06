import 'package:flutter/material.dart';
import 'package:priorities/views/__components/horizon_icon_button.dart';
import 'package:priorities/views/home/home_view_model.dart';
import 'package:stacked/stacked.dart';

class OptionsButton extends ViewModelWidget<HomeViewModel> {
  const OptionsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    return HorizonIconButton(
      onTap: viewModel.optionsViewButtonOnTap,
      icon: Icons.settings_rounded,
    );
  }
}
