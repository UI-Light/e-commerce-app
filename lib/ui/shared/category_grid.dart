import 'package:flutter/material.dart';

class CategoryGrid extends StatefulWidget {
  final String image;
  final String category;

  const CategoryGrid({
    super.key,
    required this.image,
    required this.category,
  });

  @override
  State<CategoryGrid> createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        children: [
          // Image.asset(
          //   widget.image,
          //   height: MediaQuery.of(context).size.height / 12,
          // ),
          Container(
            height: MediaQuery.of(context).size.height / 12,
            width: MediaQuery.of(context).size.width / 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Color(0xFFA4D6E7),
              //D1EBF4 //A4D6E7
              image: DecorationImage(
                  image: AssetImage(widget.image), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            widget.category,
            maxLines: 1,
            overflow: TextOverflow.clip,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
