import 'package:flutter/material.dart';
import 'package:shopping_app/core/models/category_model.dart';
import 'package:shopping_app/core/presentation/widgets/products_box.dart';
import 'package:shopping_app/features/category/presentation/view_model/category_products_viewmodel.dart';
import 'package:shopping_app/features/category/presentation/widgets/items_loading_listview.dart';

class CategoryProducts extends StatefulWidget {
  final Category category;
  final ValueNotifier<String> searchQuery;
  const CategoryProducts({
    super.key,
    required this.category,
    required this.searchQuery,
  });

  @override
  State<CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  final CategoryProductsViewModel categoryProductsViewModel =
      CategoryProductsViewModel();

  void _searchQueryListener() {
    categoryProductsViewModel.search(widget.searchQuery.value);
  }

  @override
  void initState() {
    super.initState();
    categoryProductsViewModel.getProductsInCategory(widget.category).then(
      (value) {
        if (widget.searchQuery.value.isNotEmpty) {
          categoryProductsViewModel.search(widget.searchQuery.value);
        }
      },
    );
    widget.searchQuery.addListener(_searchQueryListener);
  }

  @override
  void dispose() {
    widget.searchQuery.removeListener(_searchQueryListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: categoryProductsViewModel.productsLoading,
        builder: (context, isLoadingProducts, _) {
          return isLoadingProducts
              ? const ItemsLoadingListView()
              : ValueListenableBuilder(
                  valueListenable:
                      categoryProductsViewModel.productsInCategoryNotifier,
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
