import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/core/models/product_model.dart';
import 'package:shopping_app/core/presentation/palette.dart';
import 'package:shopping_app/core/presentation/widgets/stars.dart';
import 'package:shopping_app/features/favourites/presentation/viewmodels/favourites_view_model.dart';
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
  bool isFavoriteProduct = false;

  void saveItem(Product product) {
    if (isFavoriteProduct) {
      context.read<FavouritesViewModel>().removeFavouriteProduct(product);
      isFavoriteProduct = false;
    } else {
      context.read<FavouritesViewModel>().addFavouriteProduct(product);
      isFavoriteProduct = true;
    }
    setState(() {});
  }

  Future<void> checkForProduct() async {
    isFavoriteProduct = await context
        .read<FavouritesViewModel>()
        .checkForProduct(widget.product);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    checkForProduct();
  }

  @override
  void didUpdateWidget(covariant ProductsBox oldWidget) {
    if (oldWidget.product.id != widget.product.id) {
      checkForProduct();
    }
    super.didUpdateWidget(oldWidget);
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
                  image: NetworkImage(
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
                      saveItem(widget.product);
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: isFavoriteProduct ? Palette.blue : Colors.white,
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: Text(
                      widget.product.title,
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const Stars(),
                ],
              ),
              Text(widget.product.formattedPrice,
                  style: const TextStyle(color: Palette.blue, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
