import 'package:flutter/material.dart';
import 'package:shopping_app/ui/shared/category_grid.dart';
import 'package:shopping_app/ui/shared/discount_grid.dart';
import 'package:shopping_app/ui/shared/palette.dart';
import 'package:shopping_app/ui/shared/products_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: Container(
          margin: const EdgeInsets.only(top: 10.0),
          height: MediaQuery.of(context).size.height / 10,
          padding: const EdgeInsets.only(
            top: 10.0,
            left: 10.0,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: "Search",
              suffixIcon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
        actions: const [
          Icon(
            Icons.notifications_outlined,
            color: Colors.black,
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "All Categories",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(color: Palette.blue, fontSize: 16),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryGrid(
                        image: 'assets/lipstick.png', category: 'lipsticks'),
                    CategoryGrid(
                        image: 'assets/makeup.png', category: 'makeup'),
                    CategoryGrid(
                        image: 'assets/perfume.png', category: 'perfumes'),
                    CategoryGrid(
                        image: 'assets/skincare.png', category: 'skincare'),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    DiscountGrid(),
                    DiscountGrid(),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Products",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(color: Palette.blue, fontSize: 16),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ProductsGrid(
                      productName: 'Garnier Facewash',
                      price: '\$200',
                      image: '',
                      color: Palette.productGridBg,
                    ),
                    ProductsGrid(
                      productName: 'Shibaki Cream',
                      price: '\$1500',
                      image: '',
                      color: Palette.productGridBg,
                    ),
                    ProductsGrid(
                      productName: 'Shibaki Cream',
                      price: '\$1500',
                      image: '',
                      color: Palette.productGridBg,
                    ),
                    ProductsGrid(
                      productName: 'Garnier Facewash',
                      price: '\$200',
                      image: '',
                      color: Palette.productGridBg,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "New Arrivals",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(color: Palette.blue, fontSize: 16),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ProductsGrid(
                      productName: 'Laneige lip mask',
                      price: '\$600',
                      image: '',
                      color: Palette.productGridBg,
                    ),
                    ProductsGrid(
                      productName: 'Dove Combo',
                      price: '\$3000',
                      image: '',
                      color: Palette.productGridBg,
                    ),
                    ProductsGrid(
                      productName: 'Shibaki Cream',
                      price: '\$1500',
                      image: '',
                      color: Palette.productGridBg,
                    ),
                    ProductsGrid(
                      productName: 'Garnier Facewash',
                      price: '\$200',
                      image: "",
                      color: Palette.productGridBg,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
