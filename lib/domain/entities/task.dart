import 'package:objectbox/objectbox.dart';
import 'package:priorities/domain/base/base_entity.dart';
import 'package:priorities/domain/entities/priority.dart';

@Entity()
class Task extends BaseEntity {
  int id = 0;
  String title;
  bool isCompleted;

  final priority = ToOne<Priority>();

  Task({
    required this.title,
    required this.isCompleted,
  });
}
