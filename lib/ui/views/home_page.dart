import 'package:flutter/material.dart';
import 'package:shopping_app/ui/shared/category_grid.dart';
import 'package:shopping_app/ui/shared/discount_grid.dart';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppBar(
                  leading: const Icon(Icons.menu),
                  title: Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    height: MediaQuery.of(context).size.height / 15,
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
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  actions: const [
                    Icon(Icons.notifications_outlined),
                  ],
                ),
                const SizedBox(height: 15),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "All Categories",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const SingleChildScrollView(
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
                const SizedBox(
                  height: 20,
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      DiscountGrid(),
                      DiscountGrid(),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Products",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ProductsGrid(
                          productName: 'Garnier Facewash',
                          price: '\$200',
                          image: ''),
                      ProductsGrid(
                        productName: 'Shibaki Cream',
                        price: '\$1500',
                        image: '',
                      ),
                      ProductsGrid(
                        productName: 'Shibaki Cream',
                        price: '\$1500',
                        image: '',
                      ),
                      ProductsGrid(
                        productName: 'Garnier Facewash',
                        price: '\$200',
                        image: '',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "New Arrivals",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ProductsGrid(
                        productName: 'Laneige lip mask',
                        price: '\$600',
                        image: '',
                      ),
                      ProductsGrid(
                          productName: 'Dove Combo',
                          price: '\$3000',
                          image: ''),
                      ProductsGrid(
                          productName: 'Shibaki Cream',
                          price: '\$1500',
                          image: ''),
                      ProductsGrid(
                          productName: 'Garnier Facewash',
                          price: '\$200',
                          image: ""),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: IconButton(
      //           icon: const Icon(
      //             Icons.home,
      //             color: Colors.blue,
      //           ),
      //           onPressed: () {},
      //         ),
      //         label: ''),
      //     BottomNavigationBarItem(
      //         icon: IconButton(
      //           icon: const Icon(
      //             Icons.category,
      //             color: Colors.grey,
      //           ),
      //           onPressed: () {
      //             Navigator.of(context).push(
      //               MaterialPageRoute(
      //                 builder: (context) => const CategoryPage(),
      //               ),
      //             );
      //           },
      //         ),
      //         label: ''),
      //     BottomNavigationBarItem(
      //         icon: IconButton(
      //           icon: const Icon(
      //             Icons.favorite,
      //             color: Colors.grey,
      //           ),
      //           onPressed: () {},
      //         ),
      //         label: ''),
      //     BottomNavigationBarItem(
      //         icon: IconButton(
      //           icon: const Icon(
      //             Icons.person,
      //             color: Colors.grey,
      //           ),
      //           onPressed: () {},
      //         ),
      //         label: '')
      //   ],
      // ),
    );
  }
}
