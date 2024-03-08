import 'package:flutter/foundation.dart' hide Category;
import 'package:get_it/get_it.dart';
import 'package:shopping_app/core/models/product_model.dart';
import 'package:shopping_app/core/presentation/base_view_model.dart';
import 'package:shopping_app/core/utils/logger.dart';
import 'package:shopping_app/features/category/data/category_repository.dart';

class CategoryViewModel extends BaseViewModel {
  late final _logger = getLogger(CategoryViewModel);

  final ValueNotifier<List<Product>> _electronicItemsNotifier =
      ValueNotifier([]);
  ValueNotifier<List<Product>> get electronicItemsNotifier =>
      _electronicItemsNotifier;

  final ValueNotifier<List<Product>> _jewelleryNotifier = ValueNotifier([]);
  ValueNotifier<List<Product>> get jewelleryNotifier => _jewelleryNotifier;

  final ValueNotifier<List<Product>> _menClothesNotifier = ValueNotifier([]);
  ValueNotifier<List<Product>> get menClothesNotifier => _menClothesNotifier;

  final ValueNotifier<List<Product>> _womenClothesNotifier = ValueNotifier([]);
  ValueNotifier<List<Product>> get womenClothesNotifier =>
      _womenClothesNotifier;

  final ValueNotifier<bool> _electronicItemsLoading = ValueNotifier(false);
  ValueNotifier<bool> get electronicItemsLoading => _electronicItemsLoading;

  final ValueNotifier<bool> _jewelleryLoading = ValueNotifier(false);
  ValueNotifier<bool> get jewelleryLoading => _jewelleryLoading;

  final ValueNotifier<bool> _menClothesLoading = ValueNotifier(false);
  ValueNotifier<bool> get menClothesLoading => _menClothesLoading;

  final ValueNotifier<bool> _womenClothesLoading = ValueNotifier(false);
  ValueNotifier<bool> get womenClothesLoading => _womenClothesLoading;

  void setElectronicItemsLoading(bool val) {
    _electronicItemsLoading.value = val;
  }

  void setJewelleryLoading(bool val) {
    _jewelleryLoading.value = val;
  }

  void setMenClothesLoading(bool val) {
    _menClothesLoading.value = val;
  }

  void setWomenClothesLoading(bool val) {
    _womenClothesLoading.value = val;
  }

  Future<void> getElectronicItems() async {
    try {
      setElectronicItemsLoading(true);
      final products = await GetIt.I<CategoryRepository>().getElectronicItems();
      electronicItemsNotifier.value = products;
    } catch (e) {
      _logger.log(e);
    }
    setElectronicItemsLoading(false);
  }

  Future<void> getJewellery() async {
    try {
      setJewelleryLoading(true);
      final products = await GetIt.I<CategoryRepository>().getJewellery();
      jewelleryNotifier.value = products;
    } catch (e) {
      _logger.log(e);
    }
    setJewelleryLoading(false);
  }

  Future<void> getMenClothes() async {
    try {
      setMenClothesLoading(true);
      final products = await GetIt.I<CategoryRepository>().getMenClothes();
      menClothesNotifier.value = products;
    } catch (e) {
      _logger.log(e);
    }
    setMenClothesLoading(false);
  }

  Future<void> getWomenClothes() async {
    try {
      setWomenClothesLoading(true);
      final products = await GetIt.I<CategoryRepository>().getWomenClothes();
      womenClothesNotifier.value = products;
    } catch (e) {
      _logger.log(e);
    }
    setWomenClothesLoading(false);
  }
}
