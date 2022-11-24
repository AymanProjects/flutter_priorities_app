import 'package:priorities/presentation/views/priority/priority_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class TitleTextField extends ConsumerWidget {
  const TitleTextField({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final viewModel = ref.read(priorityViewModelProvider);
    return TextFormField(
      focusNode: viewModel.textKeyboardNode,
      controller: viewModel.titleController,
      validator: viewModel.titleValidator,
      onChanged: viewModel.onTitlechanged,
      decoration: const InputDecoration(
        border: InputBorder.none,
        label: Text(
          'Title',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
