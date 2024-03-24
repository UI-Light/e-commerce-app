import 'package:flutter/foundation.dart';
import 'package:shopping_app/core/data/storage_service.dart';
import 'package:shopping_app/core/models/product_model.dart';

class FavouritesViewModel extends ChangeNotifier {
  final StorageService _storageService = StorageService();

  final ValueNotifier<List<Product>> _favouriteProducts = ValueNotifier([]);
  ValueNotifier<List<Product>> get favouriteProducts => _favouriteProducts;

  Future<void> getFavouriteProducts() async {
    favouriteProducts.value = await _storageService.getProducts();
    notifyListeners();
  }

  Future<void> addFavouriteProduct(Product model) async {
    await _storageService.addProducts(model);
    await getFavouriteProducts();
    notifyListeners();
  }

  Future<void> removeFavouriteProduct(Product product) async {
    await _storageService.removeProducts(product);
    await getFavouriteProducts();
    notifyListeners();
  }

  Future<void> checkForProduct(Product product) async {
    await _storageService.doesProductExist(product);
    notifyListeners();
  }
}
