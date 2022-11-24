import 'package:priorities/presentation/views/priority/providers/currently_viewed_priority.dart';
import 'package:priorities/presentation/views/priority/priority_view.dart';
import 'package:priorities/services/navigation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:priorities/data/models/priority.dart';
import 'package:priorities/data/models/task.dart';
import 'package:priorities/injection.dart';

final priorityBlockViewModelProvider =
    AutoDisposeProviderFamily<_PriorityBlockViewModel, Priority>(
  (ref, priority) => _PriorityBlockViewModel(ref, priority),
);

class _PriorityBlockViewModel {
  final Ref ref;
  final Priority priority;
  List<Task> tasks = [];

  _PriorityBlockViewModel(this.ref, this.priority);

  double getProgress() {
    if (tasks.isEmpty) {
      return 0.0;
    }
    return (_completedTasks()).length / tasks.length;
  }

  List<Task> _completedTasks() {
    return tasks.where((task) => task.isCompleted).toList();
  }

  void priorityBlockOnTap() async {
    ref
        .read(currentlyViewedPriorityProvider.notifier)
        .setPriority((_) => priority);
    locator<NavigationService>().openPage(const PriorityView());
  }
}
