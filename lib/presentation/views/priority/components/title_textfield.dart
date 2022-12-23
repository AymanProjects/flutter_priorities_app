import 'package:priorities/presentation/views/priority/providers/currently_viewed_priority.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class TitleTextField extends ConsumerWidget {
  const TitleTextField({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final initialValue = ref.read(currentlyViewedPriority).valueOrNull?.title;
    return TextFormField(
      initialValue: initialValue,
      validator: titleValidator,
      onChanged: (value) => changeTitle(value, ref),
      style: TextStyle(
        fontSize: 24.0,
        color: Colors.black.withOpacity(0.75),
      ),
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
    ref.read(currentlyViewedPriority.notifier).updateState(
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
