import 'package:get_it/get_it.dart';
import 'package:shopping_app/core/data/api_client.dart';
import 'package:shopping_app/core/models/product_model.dart';
import 'package:shopping_app/core/utils/logger.dart';

class CategoryRepository {
  CategoryRepository({ApiClient? client})
      : _client = client ?? GetIt.I<ApiClient>();

  final ApiClient _client;
  late final _logger = getLogger(CategoryRepository);

  Future<List<Product>> getAllItems() async {
    final response = await _client.dio.get('products');

    if (response.statusCode == 200) {
      List<Product> products = List<Product>.from(
          response.data.map((product) => Product.fromJson(product)));
      return products;
    } else {
      throw Exception("Failed to load Products");
    }
  }
}
