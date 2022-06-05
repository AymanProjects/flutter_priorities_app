import 'package:priorities/domain/base/base_entity.dart';

class Task extends BaseEntity {
  String title;
  bool isCompleted;

  Task({
    this.title = 'Untitled',
    this.isCompleted = false,
  });
}
