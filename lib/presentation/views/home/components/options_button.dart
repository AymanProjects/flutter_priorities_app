import 'package:flutter/material.dart';
import 'package:priorities/presentation/__components/horizon_icon_button.dart';
import 'package:priorities/presentation/views/home/home_view_model.dart';
import 'package:stacked/stacked.dart';

class OptionsButton extends ViewModelWidget<HomeViewModel> {
  const OptionsButton({Key? key}) : super(key: key);

  @override
  bool get reactive => false;

  @override
  Widget build(BuildContext context, viewModel) {
    return HorizonThinButton(
      onPressed: () {},
      icon: Icons.settings_rounded,
    );
  }
}