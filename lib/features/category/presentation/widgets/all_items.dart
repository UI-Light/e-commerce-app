import 'package:flutter/material.dart';
import 'package:shopping_app/core/presentation/widgets/products_box.dart';
import 'package:shopping_app/features/category/presentation/view_model/category_view_model.dart';
import 'package:shopping_app/features/category/presentation/widgets/items_loading_listview.dart';
import 'package:shopping_app/features/home/presentation/widgets/product_loading_listview.dart';

class AllItems extends StatefulWidget {
  const AllItems({super.key});

  @override
  State<AllItems> createState() => _AllItemsState();
}

class _AllItemsState extends State<AllItems> {
  CategoryViewModel categoryViewModel = CategoryViewModel();

  @override
  void initState() {
    categoryViewModel.getAllItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: categoryViewModel.allItemsloading,
        builder: (context, isLoadingAllItems, _) {
          return isLoadingAllItems
              ? const ItemsLoadingListView()
              : ValueListenableBuilder(
                  valueListenable: categoryViewModel.allItemsNotifier,
                  builder: (context, allItems, _) {
                    return GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 6,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                      ),
                      children: [
                        for (final product in allItems)
                          ProductsBox(product: product)
                      ],
                    );
                  });
        });
  }
}
