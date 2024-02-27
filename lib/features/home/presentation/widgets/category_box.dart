import 'package:flutter/material.dart';
import 'package:shopping_app/core/models/category_model.dart';
import 'package:shopping_app/core/presentation/palette.dart';

class CategoryBox extends StatelessWidget {
  final Category category;
  const CategoryBox({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 10,
            width: MediaQuery.of(context).size.width / 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Palette.categoryBoxBg,
              image: DecorationImage(
                  image: AssetImage(category.image), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            category.name,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
