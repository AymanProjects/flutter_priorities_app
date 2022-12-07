import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:priorities/data/clients/hive_client.dart';
import 'package:priorities/providers/repo_providers.dart';

Future<void> initClients() async {
  await HiveStorageClient.init();
}

Future<void> initProviders(ProviderContainer container) async {
  await container.read(categoriesRepoProvider).initDefaultValues();
}
