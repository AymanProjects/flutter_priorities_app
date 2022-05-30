import 'package:flutter/material.dart';
import 'package:priorities/views/__components/horizon_icon_button.dart';

/// TODO horizon kit

class PopButton extends StatelessWidget {
  const PopButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HorizonIconButton(
      onTap: Navigator.of(context).pop,
      icon: Icons.arrow_back_ios,
    );
  }
}
