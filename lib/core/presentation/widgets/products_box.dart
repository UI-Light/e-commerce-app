import 'package:flutter/material.dart';
import 'package:shopping_app/core/models/product_model.dart';
import 'package:shopping_app/core/presentation/palette.dart';
import 'package:shopping_app/core/presentation/widgets/stars.dart';
import 'package:shopping_app/features/product_details/presentation/views/product_details_page.dart';

class ProductsBox extends StatefulWidget {
  final Product product;
  final Color color;

  const ProductsBox({
    super.key,
    required this.product,
    this.color = Palette.categoryBoxBg,
  });

  @override
  State<ProductsBox> createState() => _ProductsBoxState();
}

class _ProductsBoxState extends State<ProductsBox> {
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
                builder: (context) => ProductDetailsPage(
                      product: widget.product,
                    ))),
            child: Container(
              height: MediaQuery.of(context).size.height / 7,
              width: MediaQuery.of(context).size.width / 2.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: widget.color,
                image: DecorationImage(
                  image: AssetImage(
                    widget.product.image,
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
                    widget.product.title,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  const Stars(),
                ],
              ),
              Text('\$${widget.product.price}',
                  style: const TextStyle(color: Palette.blue, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
