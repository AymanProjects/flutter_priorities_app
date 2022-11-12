import 'package:priorities/data/models/priority.dart';
import 'package:priorities/data/models/task.dart';
import 'package:stacked/stacked.dart';

class PriorityBlockViewModel extends BaseViewModel {
  final Priority priority;
  List<Task> tasks = [];

  PriorityBlockViewModel(this.priority);

  double getProgress() {
    if (tasks.isEmpty) {
      return 0.0;
    }
    return (_completedTasks()).length / tasks.length;
  }

  List<Task> _completedTasks() {
    return tasks.where((task) => task.isCompleted).toList();
  }
}
