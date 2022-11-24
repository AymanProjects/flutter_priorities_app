import 'package:priorities/presentation/__components/horizon_icon_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class OptionsButton extends ConsumerWidget {
  const OptionsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return HorizonThinButton(
      onPressed: () {},
      icon: Icons.settings_rounded,
    );
  }
}
