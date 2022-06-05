import 'package:priorities/domain/base/base_entity.dart';

class Category extends BaseEntity {
  String title;

  Category({
    this.title = 'Untitled',
  });
}
