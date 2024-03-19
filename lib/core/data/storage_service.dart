import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shopping_app/core/models/product_model.dart';

class StorageService {
  final storage = const FlutterSecureStorage();
  Future<void> add(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future<void> remove(String key) async {
    await storage.delete(key: key);
  }

  List<Product> getFavourites(String key) {
    final products = storage.read(key: key);

    List<Product> productList =
        List<Product>.from(jsonDecode(products.toString()));
    return productList;
  }
}
