import 'package:shopping_app/core/models/rating_model.dart';

class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;
  String get formattedPrice {
    return '\$$price';
  }

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> data) {
    return Product(
        id: data['id'] as int,
        title: data['title'],
        price: double.parse(data["price"].toString()),
        description: data['description'],
        category: data['category'],
        image: data['image'],
        rating: Rating.fromJson(data['rating']));
  }
}
