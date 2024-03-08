import 'package:flutter/material.dart';
import 'package:shopping_app/core/presentation/widgets/products_box.dart';
import 'package:shopping_app/features/category/presentation/view_model/category_view_model.dart';
import 'package:shopping_app/features/category/presentation/widgets/items_loading_listview.dart';

class ElectronicsTab extends StatefulWidget {
  const ElectronicsTab({super.key});

  @override
  State<ElectronicsTab> createState() => _ElectronicsTabState();
}

class _ElectronicsTabState extends State<ElectronicsTab> {
  CategoryViewModel categoryViewModel = CategoryViewModel();

  @override
  void initState() {
    categoryViewModel.getElectronicItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: categoryViewModel.electronicItemsLoading,
        builder: (context, isLoadingItems, _) {
          return isLoadingItems
              ? const ItemsLoadingListView(
                  itemCount: 6,
                )
              : ValueListenableBuilder(
                  valueListenable: categoryViewModel.electronicItemsNotifier,
                  builder: (context, items, _) {
                    return GridView.builder(
                      itemCount: items.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 6,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        return ProductsBox(product: items[index]);
                      },
                      // children: [
                      //   for (final product in items)
                      //     ProductsBox(product: product)
                      // ],
                    );
                  });
        });
  }
}
