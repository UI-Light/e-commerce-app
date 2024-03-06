import 'package:flutter/material.dart';
import 'package:shopping_app/core/models/category_model.dart';
import 'package:shopping_app/features/home/presentation/view_model/home_view_model.dart';
import 'package:shopping_app/features/home/presentation/widgets/category_loading_box.dart';
import 'package:shopping_app/features/home/presentation/widgets/category_loading_listview.dart';
import 'package:shopping_app/features/home/presentation/widgets/discount_box.dart';
import 'package:shopping_app/core/presentation/palette.dart';
import 'package:shopping_app/core/presentation/widgets/products_box.dart';
import 'package:shopping_app/features/home/presentation/widgets/product_loading_listview.dart';
import '../widgets/category_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    homeViewModel.getPopularProducts();
    homeViewModel.getNewArrivals();
    homeViewModel.getCategories();
    super.initState();
  }

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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 2),
              const Row(
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
              const SizedBox(
                height: 15,
              ),
              ValueListenableBuilder(
                  valueListenable: homeViewModel.categoriesLoading,
                  builder: (context, isLoadingCategories, _) {
                    return isLoadingCategories
                        ? const CategoryLoadingListView()
                        : ValueListenableBuilder(
                            valueListenable: homeViewModel.categoriesNotifier,
                            builder: (context, categoriesNotifier, _) {
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    for (final category in categoriesNotifier)
                                      CategoryBox(category: category)
                                  ],
                                ),
                              );
                            });
                  }),
              const SizedBox(
                height: 20,
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    DiscountBox(),
                    DiscountBox(),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              const Row(
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
              const SizedBox(
                height: 15,
              ),
              ValueListenableBuilder(
                  valueListenable: homeViewModel.popularProductsloading,
                  builder: (context, isLoadingProducts, _) {
                    return isLoadingProducts
                        ? const ProductLoadingListView()
                        : ValueListenableBuilder(
                            valueListenable: homeViewModel.productsNotifier,
                            builder: (context, popularProducts, _) {
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    for (final product in popularProducts)
                                      ProductsBox(product: product)
                                  ],
                                ),
                              );
                            });
                  }),
              const SizedBox(
                height: 15,
              ),
              const Row(
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
              const SizedBox(
                height: 15,
              ),
              ValueListenableBuilder(
                  valueListenable: homeViewModel.newArrivalsLoading,
                  builder: (context, isLoadingArrivals, _) {
                    return isLoadingArrivals
                        ? const ProductLoadingListView()
                        : ValueListenableBuilder(
                            valueListenable: homeViewModel.arrivalsNotifier,
                            builder: (context, newArrivals, _) {
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    for (final product in newArrivals)
                                      ProductsBox(product: product)
                                  ],
                                ),
                              );
                            });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
