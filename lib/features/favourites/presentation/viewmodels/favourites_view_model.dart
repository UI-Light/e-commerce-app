import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shopping_app/core/data/storage_service.dart';
import 'package:shopping_app/core/models/product_model.dart';

class FavouritesViewModel {
  final StorageService _storageService = StorageService();

  final ValueNotifier<List<Product>> _favouriteProducts = ValueNotifier([]);
  ValueNotifier<List<Product>> get favouriteProducts => _favouriteProducts;

  final String key = 'products';

  List<Product> getProducts() {
    favouriteProducts.value = _storageService.getFavourites(key);
    if (favouriteProducts.value == null) {
      return [];
    } else {
      return favouriteProducts.value;
    }
  }

  void addProducts(Product product) async {
    final List<Product> favouriteList = getProducts();
    favouriteList.add(product);
    final updatedList = favouriteList.map((product) => product.toJson());
    await _storageService.add(key, jsonEncode(favouriteList));
  }

  void removeProducts(Product product) {
    final List<Product> favouriteList = getProducts();
    for (int i = 0; i < favouriteList.length; i++) {
      favouriteList.removeWhere((element) => element.id == product.id);
    }
    final updatedFavouritesList =
        favouriteList.map((product) => product.toJson());
    jsonEncode(updatedFavouritesList);
    _storageService.remove(key);
  }
}
