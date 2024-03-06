import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
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

  final ValueNotifier<bool> _popularProductsloading = ValueNotifier(false);
  ValueNotifier<bool> get popularProductsloading => _popularProductsloading;

  final ValueNotifier<bool> _newArrivalsLoading = ValueNotifier(false);
  ValueNotifier<bool> get newArrivalsLoading => _newArrivalsLoading;

  bool get isLoadingArrivals => _newArrivalsLoading.value;
  bool get isLoadingProducts => _popularProductsloading.value;

  void setProductsLoading(bool val) {
    _popularProductsloading.value = val;
  }

  void setArrivalsLoading(bool val) {
    _newArrivalsLoading.value = val;
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
}
