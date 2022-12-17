import 'package:priorities/observers/errors_observer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:priorities/init.dart';
import 'package:flutter/material.dart';
import 'package:priorities/app.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initClients();
  final providerContainer = ProviderContainer();
  await initProviders(providerContainer);
  // await (await Hive.openBox<String>('Priorities')).clear();
  // await (await Hive.openBox<String>('Categories')).clear();
  // await (await Hive.openBox<String>('Tasks')).clear();
  // await (await Hive.openBox('User_prefs')).clear();
  runApp(
    ProviderScope(
      parent: providerContainer,
      observers: [
        ErrorsObserver(),
      ],
      child: const App(),
    ),
  );
}
