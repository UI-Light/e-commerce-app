import 'package:flutter/material.dart';
import 'package:shopping_app/core/models/category_model.dart';
import 'package:shopping_app/core/presentation/widgets/products_box.dart';
import 'package:shopping_app/features/category/presentation/view_model/category_products_viewmodel.dart';

import 'package:shopping_app/features/category/presentation/widgets/items_loading_listview.dart';

class CategoryProducts extends StatefulWidget {
  final Category category;
  const CategoryProducts({super.key, required this.category});

  @override
  State<CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  final CategoryProductsViewModel categoryViewModel =
      CategoryProductsViewModel();

  @override
  void initState() {
    categoryViewModel.getProductsInCategory(widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: categoryViewModel.productsLoading,
        builder: (context, isLoadingProducts, _) {
          return isLoadingProducts
              ? const ItemsLoadingListView()
              : ValueListenableBuilder(
                  valueListenable: categoryViewModel.productsInCategoryNotifier,
                  builder: (context, products, _) {
                    return GridView.builder(
                      itemCount: products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 6,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        return ProductsBox(product: products[index]);
                      },
                    );
                  });
        });
  }
}
