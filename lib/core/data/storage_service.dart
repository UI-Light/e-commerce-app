import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shopping_app/core/models/product_model.dart';

class StorageService {
  final storage = const FlutterSecureStorage();

  Future<void> add(int key, String value) async {
    await storage.write(key: key.toString(), value: value);
  }

  Future<void> remove(int key) async {
    await storage.delete(key: key.toString());
  }

  Future<List<Product>> getFavourites(int key) async {
    final products = await storage.read(key: key.toString());

    List<Product> productList = List<Product>.from(jsonDecode(products!));
    return productList;
  }
}
