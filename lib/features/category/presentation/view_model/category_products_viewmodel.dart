import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_app/core/models/category_model.dart';
import 'package:shopping_app/core/models/product_model.dart';
import 'package:shopping_app/core/presentation/base_view_model.dart';
import 'package:shopping_app/core/utils/logger.dart';
import 'package:shopping_app/features/category/data/category_repository.dart';

class CategoryProductsViewModel extends BaseViewModel {
  late final _logger = getLogger(CategoryProductsViewModel);

  final ValueNotifier<List<Product>> _productsInCategoryNotifier =
      ValueNotifier([]);
  ValueNotifier<List<Product>> get productsInCategoryNotifier =>
      _productsInCategoryNotifier;

  List<Product> productsList = [];

  final ValueNotifier<bool> _productsLoading = ValueNotifier(false);
  ValueNotifier<bool> get productsLoading => _productsLoading;

  void setProductsLoading(bool val) {
    _productsLoading.value = val;
  }

  Future<void> getProductsInCategory(Category category) async {
    try {
      setProductsLoading(true);
      final products =
          await GetIt.I<CategoryRepository>().getProductsForCategory(category);
      productsList = products;
      productsInCategoryNotifier.value = products;
    } catch (e) {
      _logger.log(e);
    }
    setProductsLoading(false);
  }

  //write search logic inside this viewmodel
  void search(String keyword) async {
    List<Product> filteredItems = [];

    for (int i = 0; i < productsList.length; i++) {
      if (productsList[i].title.toLowerCase().contains(keyword.toLowerCase())) {
        filteredItems.add(productsList[i]);
      }
    }
    productsInCategoryNotifier.value = [...filteredItems];
  }
}
