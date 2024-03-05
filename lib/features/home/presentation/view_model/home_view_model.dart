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

  Future<void> getPopularProducts() async {
    try {
      setLoading(true);
      final products = await GetIt.I<HomeRepository>().getPopularProducts();
      _productsNotifier.value = products;
    } catch (e) {
      // an error was thrown.
      // this needs to be handled and shown in the UI.
      _logger.log(e);
    }
    setLoading(false);
  }

  Future<void> getNewArrivals() async {
    try {
      setLoading(true);
      final products = await GetIt.I<HomeRepository>().getNewArrivals();
      arrivalsNotifier.value = products;
    } catch (e) {
      _logger.log(e);
    }
    setLoading(false);
  }
}
