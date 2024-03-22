import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shopping_app/core/models/product_model.dart';
import 'package:shopping_app/core/utils/logger.dart';

class StorageService {
  final storage = const FlutterSecureStorage();
  String key = 'products';
  final _logger = getLogger(StorageService);

  Future<List<Product>> getProducts() async {
    final favouriteProducts = await storage.read(key: key);
    _logger.log(favouriteProducts);
    if (favouriteProducts == null) {
      return [];
    } else {
      final jsonDecodedList = List.from(jsonDecode(favouriteProducts));
      final productList = jsonDecodedList.map((e) => Product.fromJson(e));
      return productList.toList();
    }
  }

  Future<void> addProducts(Product model) async {
    final List<Product> favouriteList = await getProducts();
    favouriteList.add(model);
    final updatedList =
        favouriteList.map((product) => product.toJson()).toList();
    //json encode my new list? - updatedList or favouriteList
    await storage.write(key: key, value: jsonEncode(updatedList));
  }

  Future<void> removeProducts(Product product) async {
    final List<Product> favouriteList = await getProducts();
    favouriteList.removeWhere((element) => element.id == product.id);
    final updatedList =
        favouriteList.map((product) => product.toJson()).toList();
    await storage.write(key: key, value: jsonEncode(updatedList));
  }

  Future<bool> doesProductExist(Product product) async {
    final List<Product> favouriteProducts = await getProducts();
    if (favouriteProducts.any((element) => element.id == product.id)) {
      return true;
    } else {
      return false;
    }
  }
}
