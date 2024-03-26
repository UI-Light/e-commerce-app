import 'package:flutter/foundation.dart';
import 'package:shopping_app/core/data/storage_service.dart';
import 'package:shopping_app/core/models/product_model.dart';

class FavouritesViewModel {
  final StorageService _storageService = StorageService();

  final ValueNotifier<List<Product>> _favouriteProducts = ValueNotifier([]);
  ValueNotifier<List<Product>> get favouriteProducts => _favouriteProducts;

  Future<void> getFavouriteProducts() async {
    favouriteProducts.value = await _storageService.getProducts();
  }

  Future<void> addFavouriteProduct(Product model) async {
    await _storageService.addProducts(model);
    await getFavouriteProducts();
  }

  Future<void> removeFavouriteProduct(Product product) async {
    await _storageService.removeProducts(product);
    await getFavouriteProducts();
  }

  Future<bool> checkForProduct(Product product) async {
    return await _storageService.doesProductExist(product);
  }
}
