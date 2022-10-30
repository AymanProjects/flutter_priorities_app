import 'package:priorities/presentation/__components/horizon_icon_button.dart';
import 'package:flutter/material.dart';

class ClosePageButton extends StatelessWidget {
  const ClosePageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizonIconButton(
      onPressed: Navigator.of(context).pop,
      icon: Icons.arrow_back_ios,
    );
  }
}
