import 'package:priorities/presentation/views/priority/providers/currently_viewed_priority.dart';
import 'package:priorities/presentation/views/priority/providers/focus_node_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class TitleTextField extends ConsumerWidget {
  const TitleTextField({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final initialValue = ref.read(currentlyViewedPriority).valueOrNull?.title;
    final focusNode = ref.watch(priorityViewFocusNode);
    return TextFormField(
      initialValue: initialValue,
      validator: titleValidator,
      focusNode: focusNode,
      onChanged: (value) => changeTitle(value, ref),
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

  void changeTitle(String title, WidgetRef ref) {
    ref.read(currentlyViewedPriority.notifier).setPriority(
          (priority) => priority.copyWith(title: title),
        );
  }

  String? titleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Title must be provided';
    }
    return null;
  }
}
