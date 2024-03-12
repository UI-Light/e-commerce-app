import 'package:get_it/get_it.dart';
import 'package:shopping_app/core/data/api_client.dart';
import 'package:shopping_app/core/models/category_model.dart';
import 'package:shopping_app/core/models/product_model.dart';

class CategoryRepository {
  CategoryRepository({ApiClient? client})
      : _client = client ?? GetIt.I<ApiClient>();

  final ApiClient _client;

  Future<List<Product>> getProductsForCategory(Category category) async {
    final response =
        await _client.dio.get('products/category/${category.name}');
    if (response.statusCode == 200) {
      List<Product> products = List<Product>.from(
          response.data.map((product) => Product.fromJson(product)));
      return products;
    } else {
      throw Exception("Failed to load Products");
    }
  }
}
