import 'package:flutter/material.dart';
import 'package:shopping_app/ui/shared/products_grid.dart';
import 'package:shopping_app/ui/views/product_details_page.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'All Categories',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              height: MediaQuery.of(context).size.height / 18,
              padding: const EdgeInsets.only(
                top: 10.0,
                left: 15.0,
              ),
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  suffixIcon: Icon(
                    Icons.search,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'All Items',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                Text(
                  'Popular Items',
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),
                Text(
                  'Best Deals',
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Expanded(
              child: GridView(
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
                        productName: "Garnier Facewash", price: "\$300"),
                  ),
                  const ProductsGrid(
                      productName: "Garnier Facewash", price: "\$300"),
                  const ProductsGrid(
                      productName: "Garnier Facewash", price: "\$300"),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
