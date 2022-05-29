import 'package:flutter/material.dart';
import 'package:priorities/views/__components/horizon_icon_button.dart';
import 'package:priorities/views/home/home_view_model.dart';
import 'package:stacked/stacked.dart';

class OptionsViewButton extends ViewModelWidget<HomeViewModel> {
  const OptionsViewButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        HorizonIconButton(
          onTap: viewModel.optionsViewButtonOnTap,
          icon: Icons.settings_rounded,
        ),
      ],
    );
  }
}
