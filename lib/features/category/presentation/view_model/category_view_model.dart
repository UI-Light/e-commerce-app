import 'package:flutter/foundation.dart' hide Category;
import 'package:get_it/get_it.dart';
import 'package:shopping_app/core/models/category_model.dart';
import 'package:shopping_app/core/models/product_model.dart';
import 'package:shopping_app/core/presentation/base_view_model.dart';
import 'package:shopping_app/core/utils/logger.dart';
import 'package:shopping_app/features/category/data/category_repository.dart';
import 'package:shopping_app/features/home/data/home_repository.dart';

class CategoryViewModel extends BaseViewModel {
  late final _logger = getLogger(CategoryViewModel);

  final ValueNotifier<List<Product>> _productsInCategoryNotifier =
      ValueNotifier([]);
  ValueNotifier<List<Product>> get productsInCategoryNotifier =>
      _productsInCategoryNotifier;

  final ValueNotifier<List<Category>> _categoriesNotifier = ValueNotifier([]);
  ValueNotifier<List<Category>> get categoriesNotifier => _categoriesNotifier;

  final ValueNotifier<bool> _productsLoading = ValueNotifier(false);
  ValueNotifier<bool> get productLoading => _productsLoading;

  final ValueNotifier<bool> _categoriesLoading = ValueNotifier(false);
  ValueNotifier<bool> get categoriesLoading => _categoriesLoading;

  void setProductsLoading(bool val) {
    _productsLoading.value = val;
  }

  void setCategoriesLoading(bool val) {
    _categoriesLoading.value = val;
  }

  Future<void> getProductsInCategory(Category category) async {
    try {
      setProductsLoading(true);
      final products =
          await GetIt.I<CategoryRepository>().getProductsForCategory(category);
      productsInCategoryNotifier.value = products;
    } catch (e) {
      _logger.log(e);
    }
    setProductsLoading(false);
  }

  Future<void> getCategories() async {
    try {
      setCategoriesLoading(true);
      final products = await GetIt.I<HomeRepository>().getCategories();
      _categoriesNotifier.value = products;
    } catch (e) {
      _logger.log(e);
    }
    setCategoriesLoading(false);
  }
}
