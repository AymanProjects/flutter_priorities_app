import 'package:priorities/injection.dart';
import 'package:flutter/material.dart';
import 'package:priorities/app.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependencies();
  // await (await Hive.openBox('priorities')).clear();
  // await (await Hive.openBox('categories')).clear();
  // await (await Hive.openBox('tasks')).clear();
  // await (await Hive.openBox('user_prefs')).clear();
  runApp(const App());
}
