import 'package:flutter/material.dart';
import 'package:priorities/app.dart';
import 'package:priorities/init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const App());
}
