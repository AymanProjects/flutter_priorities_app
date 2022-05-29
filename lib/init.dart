import 'package:priorities/data/repos/priorities_repo.dart';

Future init() async {
  await PrioritiesRepo().init();
}
