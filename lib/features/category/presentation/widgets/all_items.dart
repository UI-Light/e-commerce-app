import 'package:flutter/material.dart';
import 'package:shopping_app/core/models/product_model.dart';
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
      children: [
        for (final product in Product.products) ProductsBox(product: product)
      ],
    );
  }
}
