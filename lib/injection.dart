import 'package:priorities/data/data_sources/local/categories/hive_data_source.dart';
import 'package:priorities/data/data_sources/local/priorities/hive_data_source.dart';
import 'package:priorities/data/data_sources/local/tasks/hive_data_source.dart';
import 'package:priorities/data/repositories/categories_repo.dart';
import 'package:priorities/data/repositories/priorities_repo.dart';
import 'package:priorities/data/repositories/tasks_repository.dart';
import 'package:priorities/data/clients/hive_client.dart';
import 'package:priorities/services/snackbar_service.dart';
import 'package:priorities/services/navigation_service.dart';
import 'package:priorities/services/user_prefs_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

/// This method is called in the main.
///
/// Anything that needs to be injected at app start,
/// should be registered like this `locator.registerSingleton<Type>(object);`
/// So that it can be access anywhere in the app like this `final object = locator<Type>();`
///
Future<void> injectDependencies() async {
  // Initialize the dependencies
  await HiveStorageClient.init();
  const router = NavigationService();
  const notifier = SnackBarService();
  const userPrefs = UserPrefsService();
  const categoriesRepo = CategoriesRepository(
    localSource: HiveCategoriesLocalDataSource(),
  );
  await categoriesRepo.initDefaultValues();
  const prioritiesRepo = PrioritiesRepository(
    localSource: HivePrioritiesLocalDataSource(),
  );
  const tasksRepo = TasksRepository(
    localSource: HiveTaskasksLocalDataSource(),
  );

  // Register the dependencies
  locator.registerSingleton<NavigationService>(router);
  locator.registerSingleton<SnackBarService>(notifier);
  locator.registerSingleton<UserPrefsService>(userPrefs);
  locator.registerSingleton<CategoriesRepository>(categoriesRepo);
  locator.registerSingleton<PrioritiesRepository>(prioritiesRepo);
  locator.registerSingleton<TasksRepository>(tasksRepo);
}
