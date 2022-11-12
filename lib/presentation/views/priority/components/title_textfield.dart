import 'package:priorities/presentation/views/priority/priority_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TitleTextField extends ViewModelWidget<PriorityViewModel> {
  const TitleTextField({super.key});

  @override
  Widget build(BuildContext context, viewModel) {
    return TextFormField(
      focusNode: viewModel.textKeyboardNode,
      controller: viewModel.titleController,
      validator: viewModel.titleValidator,
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
