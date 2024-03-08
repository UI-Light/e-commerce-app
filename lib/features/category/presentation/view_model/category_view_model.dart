import 'package:flutter/foundation.dart' hide Category;
import 'package:get_it/get_it.dart';
import 'package:shopping_app/core/models/product_model.dart';
import 'package:shopping_app/core/presentation/base_view_model.dart';
import 'package:shopping_app/core/utils/logger.dart';
import 'package:shopping_app/features/category/data/category_repository.dart';

class CategoryViewModel extends BaseViewModel {
  late final _logger = getLogger(CategoryViewModel);

  final ValueNotifier<List<Product>> _allItemsNotifier = ValueNotifier([]);
  ValueNotifier<List<Product>> get allItemsNotifier => _allItemsNotifier;

  final ValueNotifier<bool> _allItemsloading = ValueNotifier(false);
  ValueNotifier<bool> get allItemsloading => _allItemsloading;

  void setAllItemsLoading(bool val) {
    _allItemsloading.value = val;
  }

  Future<void> getAllItems() async {
    try {
      setAllItemsLoading(true);
      final products = await GetIt.I<CategoryRepository>().getAllItems();
      allItemsNotifier.value = products;
    } catch (e) {
      _logger.log(e);
    }
    setAllItemsLoading(false);
  }
}
