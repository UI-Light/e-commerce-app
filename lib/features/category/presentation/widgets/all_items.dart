import 'package:flutter/material.dart';
import 'package:shopping_app/core/presentation/widgets/products_grid.dart';
import 'package:shopping_app/features/product_details/presentation/views/product_details_page.dart';

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
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ProductDetailsPage())),
          child: const ProductsGrid(
              productName: "Garnier Facewash",
              price: "\$300",
              image: 'assets/lipstick.png'),
        ),
        const ProductsGrid(
            productName: "Garnier Facewash",
            price: "\$300",
            image: 'assets/skincare.png'),
        const ProductsGrid(
            productName: "Garnier Facewash",
            price: "\$300",
            image: 'assets/makeup.png'),
        const ProductsGrid(
            productName: "Garnier Facewash",
            price: "\$300",
            image: 'assets/skincare.png'),
        const ProductsGrid(
            productName: "Garnier Facewash",
            price: "\$300",
            image: 'assets/skincare.png'),
        const ProductsGrid(
            productName: "Garnier Facewash",
            price: "\$300",
            image: 'assets/skincare.png'),
        const ProductsGrid(
            productName: "Garnier Facewash",
            price: "\$300",
            image: 'assets/skincare.png'),
        const ProductsGrid(
            productName: "Garnier Facewash",
            price: "\$300",
            image: 'assets/skincare.png'),
      ],
    );
  }
}
