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
        id: data['id'],
        title: data['title'],
        price: data['price'],
        description: data['description'],
        category: data['category'],
        image: data['image'],
        rating: Rating.fromJson(data['rating']));
  }

  static List<Product> products = [
    Product(
        id: 1,
        title: "Garnier Facewash",
        price: 300.0,
        description:
            "'Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        category: "",
        image: 'assets/lipstick.png',
        rating: Rating(rate: 4.0, count: 230)),
    Product(
        id: 2,
        title: "Garnier Facewash",
        price: 300.0,
        description:
            "'Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        category: "",
        image: 'assets/lipstick.png',
        rating: Rating(rate: 4.0, count: 230)),
    Product(
        id: 3,
        title: "Garnier Facewash",
        price: 300.0,
        description:
            "'Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        category: "",
        image: 'assets/lipstick.png',
        rating: Rating(rate: 4.0, count: 230)),
    Product(
        id: 4,
        title: "Garnier Facewash",
        price: 300.0,
        description:
            "'Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        category: "",
        image: 'assets/lipstick.png',
        rating: Rating(rate: 4.0, count: 230)),
    Product(
        id: 5,
        title: "Garnier Facewash",
        price: 300.0,
        description:
            "'Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        category: "",
        image: 'assets/lipstick.png',
        rating: Rating(rate: 4.0, count: 230)),
  ];
}
