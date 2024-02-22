import 'package:flutter/material.dart';
import 'package:shopping_app/core/presentation/palette.dart';

class CategoryBox extends StatefulWidget {
  final String image;
  final String category;

  const CategoryBox({
    super.key,
    required this.image,
    required this.category,
  });

  @override
  State<CategoryBox> createState() => _CategoryBoxState();
}

class _CategoryBoxState extends State<CategoryBox> {
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
                  image: AssetImage(widget.image), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            widget.category,
            // maxLines: 1,
            // overflow: TextOverflow.clip,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
