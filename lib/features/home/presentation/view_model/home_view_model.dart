import 'package:flutter/foundation.dart' hide Category;
import 'package:get_it/get_it.dart';
import 'package:shopping_app/core/models/category_model.dart';
import 'package:shopping_app/core/models/product_model.dart';
import 'package:shopping_app/core/presentation/base_view_model.dart';
import 'package:shopping_app/core/utils/logger.dart';
import 'package:shopping_app/features/home/data/home_repository.dart';

class HomeViewModel extends BaseViewModel {
  late final _logger = getLogger(HomeViewModel);

  final ValueNotifier<List<Product>> _productsNotifier = ValueNotifier([]);
  ValueNotifier<List<Product>> get productsNotifier => _productsNotifier;

  final ValueNotifier<List<Product>> _arrivalsNotifier = ValueNotifier([]);
  ValueNotifier<List<Product>> get arrivalsNotifier => _arrivalsNotifier;

  final ValueNotifier<List<Category>> _categoriesNotifier = ValueNotifier([]);
  ValueNotifier<List<Category>> get categoriesNotifier => _categoriesNotifier;

  final ValueNotifier<bool> _popularProductsloading = ValueNotifier(false);
  ValueNotifier<bool> get popularProductsloading => _popularProductsloading;

  final ValueNotifier<bool> _newArrivalsLoading = ValueNotifier(false);
  ValueNotifier<bool> get newArrivalsLoading => _newArrivalsLoading;

  final ValueNotifier<bool> _categoriesLoading = ValueNotifier(false);
  ValueNotifier<bool> get categoriesLoading => _categoriesLoading;

  void setProductsLoading(bool val) {
    _popularProductsloading.value = val;
  }

  void setArrivalsLoading(bool val) {
    _newArrivalsLoading.value = val;
  }

  void setCategoriesLoading(bool val) {
    _categoriesLoading.value = val;
  }

  Future<void> getPopularProducts() async {
    try {
      setProductsLoading(true);
      final products = await GetIt.I<HomeRepository>().getPopularProducts();
      _productsNotifier.value = products;
    } catch (e) {
      // an error was thrown.
      // this needs to be handled and shown in the UI.
      _logger.log(e);
    }
    setProductsLoading(false);
  }

  Future<void> getNewArrivals() async {
    try {
      setArrivalsLoading(true);
      final products = await GetIt.I<HomeRepository>().getNewArrivals();
      arrivalsNotifier.value = products;
    } catch (e) {
      _logger.log(e);
    }
    setArrivalsLoading(false);
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
