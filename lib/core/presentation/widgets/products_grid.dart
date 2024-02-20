import 'package:flutter/material.dart';
import 'package:shopping_app/core/presentation/palette.dart';
import 'package:shopping_app/core/presentation/widgets/stars.dart';
import 'package:shopping_app/features/product_details/presentation/views/product_details_page.dart';

class ProductsGrid extends StatefulWidget {
  final String productName;
  final String price;
  final String image;
  final Color color;
  const ProductsGrid(
      {super.key,
      required this.productName,
      required this.price,
      required this.image,
      this.color = Palette.categoryGridBg});

  @override
  State<ProductsGrid> createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  bool isClicked = false;

  void saveItem() {
    setState(() {
      isClicked = !isClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ProductDetailsPage())),
            child: Container(
              height: MediaQuery.of(context).size.height / 7,
              width: MediaQuery.of(context).size.width / 2.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: widget.color,
                image: DecorationImage(
                  image: AssetImage(
                    widget.image,
                  ),
                  fit: BoxFit.contain,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      saveItem();
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: isClicked ? Palette.blue : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.productName,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  const Stars(),
                ],
              ),
              Text(widget.price,
                  style: const TextStyle(color: Palette.blue, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
