import 'package:priorities/data/data_sources/local/hive_data_source.dart';
import 'package:priorities/providers/repo_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> initClients() async {
  await HiveDataSource.init();
}

Future<void> initProviders(ProviderContainer container) async {
  await container.read(categoriesRepoProvider).initDefaultValues();
}
