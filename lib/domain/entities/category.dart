import 'package:objectbox/objectbox.dart';
import 'package:priorities/domain/base/base_entity.dart';
import 'package:priorities/domain/entities/priority.dart';

@Entity()
class Category extends BaseEntity {
  int id = 0;
  String name;

  final priorities = ToMany<Priority>();

  Category({
    required this.name,
  });
}
