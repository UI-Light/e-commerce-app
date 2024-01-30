import 'package:flutter/material.dart';

class ProductsGrid extends StatefulWidget {
  final String productName;
  final String price;
  final String image;
  const ProductsGrid(
      {super.key,
      required this.productName,
      required this.price,
      required this.image});

  @override
  State<ProductsGrid> createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 7,
            width: MediaQuery.of(context).size.width / 2.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xFFD1EBF4),
              //D1EBF4 //A4D6E7
              image: DecorationImage(
                image: AssetImage(widget.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.productName,
                    // maxLines: 1,
                    // overflow: TextOverflow.clip,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const Icon(
                    Icons.star_rate_rounded,
                    size: 15.0,
                    color: Colors.amberAccent,
                  ),
                  const Icon(
                    Icons.star_rate_rounded,
                    size: 15.0,
                    color: Colors.amberAccent,
                  ),
                  const Icon(
                    Icons.star_rate_rounded,
                    size: 15.0,
                    color: Colors.amberAccent,
                  ),
                  const Icon(
                    Icons.star_rate_rounded,
                    size: 15.0,
                    color: Colors.amberAccent,
                  ),
                  const Icon(
                    Icons.star_rate_rounded,
                    size: 15.0,
                    color: Colors.amberAccent,
                  ),
                ],
              ),
              Text(widget.price, style: const TextStyle(color: Colors.blue)),
            ],
          ),
        ],
      ),
    );
  }
}
