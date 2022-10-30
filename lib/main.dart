import 'package:flutter/material.dart';
import 'package:priorities/app.dart';
import 'package:priorities/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependencies();
  runApp(const App());
}
