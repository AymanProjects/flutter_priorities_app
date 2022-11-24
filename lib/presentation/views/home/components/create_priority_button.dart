import 'package:priorities/presentation/__components/horizon_button.dart';
import 'package:priorities/presentation/views/home/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class CreatePriorityButton extends ConsumerWidget {
  const CreatePriorityButton({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final viewModel = ref.read(homeViewModelProvider);
    return HorizonButton(
      onPressed: viewModel.createPriorityButtonOnTap,
      icon: Icons.add_rounded,
      width: double.infinity,
      iconSize: 32.0,
    );
  }
}
