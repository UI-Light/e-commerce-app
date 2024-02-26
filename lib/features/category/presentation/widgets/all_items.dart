import 'package:flutter/material.dart';
import 'package:shopping_app/core/presentation/widgets/products_box.dart';

class AllItems extends StatelessWidget {
  const AllItems({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 6,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
      ),
      children: const [
        ProductsBox(
            productName: "Garnier Facewash",
            price: "\$300",
            image: 'assets/lipstick.png'),
        ProductsBox(
            productName: "Garnier Facewash",
            price: "\$300",
            image: 'assets/skincare.png'),
        ProductsBox(
            productName: "Garnier Facewash",
            price: "\$300",
            image: 'assets/makeup.png'),
        ProductsBox(
            productName: "Garnier Facewash",
            price: "\$300",
            image: 'assets/skincare.png'),
        ProductsBox(
            productName: "Garnier Facewash",
            price: "\$300",
            image: 'assets/skincare.png'),
        ProductsBox(
            productName: "Garnier Facewash",
            price: "\$300",
            image: 'assets/skincare.png'),
        ProductsBox(
            productName: "Garnier Facewash",
            price: "\$300",
            image: 'assets/skincare.png'),
        ProductsBox(
            productName: "Garnier Facewash",
            price: "\$300",
            image: 'assets/skincare.png'),
      ],
    );
  }
}
