import 'package:get_it/get_it.dart';
import 'package:shopping_app/core/data/api_client.dart';
import 'package:shopping_app/core/models/product_model.dart';

class HomeRepository {
  HomeRepository({ApiClient? client})
      : _client = client ?? GetIt.I<ApiClient>();

  final ApiClient _client;

  Future<List<Product>> getProducts() async {
    final response = await _client.dio.get('products');
    if (response.statusCode == 200) {
      // success, parse response body
    } else {
      // request failed, you may want to throw a custom error
    }

    return [];
  }
}
