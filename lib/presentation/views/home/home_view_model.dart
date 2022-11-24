import 'package:priorities/presentation/views/categories/categories_view.dart';
import 'package:priorities/presentation/views/priority/priority_view.dart';
import 'package:priorities/presentation/views/priority/providers/currently_viewed_priority.dart';
import 'package:priorities/services/navigation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:priorities/injection.dart';

final homeViewModelProvider = Provider.autoDispose(
  (ref) => _HomeViewModel(ref),
);

class _HomeViewModel {
  final Ref ref;
  const _HomeViewModel(this.ref);

  void createPriorityButtonOnTap() async {
    ref.invalidate(currentlyViewedPriorityProvider);
    locator<NavigationService>().openPage(const PriorityView());
  }

  void selectedCategoryButtonOnTap() async {
    locator<NavigationService>().openModal(const CategoriesView());
  }
}
