import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shopping_app/core/data/storage_service.dart';
import 'package:shopping_app/core/models/product_model.dart';

class FavouritesViewModel {
  final StorageService _storageService = StorageService();
  final ValueNotifier<List<Product>> _favouriteProducts = ValueNotifier([]);
  ValueNotifier<List<Product>> get favouriteProducts => _favouriteProducts;

  Future<void> addToFavourites(Product product, Product value) async {
    await _storageService.add(product.id, jsonEncode(value));
  }

  Future<void> removeFromFavourites(Product product) async {
    await _storageService.remove(product.id);
  }

  Future<List<Product>> getFavourites(Product product) async {
    favouriteProducts.value = await _storageService.getFavourites(product.id);
    return favouriteProducts.value;
  }
}
