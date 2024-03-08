import 'package:flutter/material.dart';
import 'package:shopping_app/core/presentation/widgets/products_box.dart';
import 'package:shopping_app/features/category/presentation/view_model/category_view_model.dart';
import 'package:shopping_app/features/category/presentation/widgets/items_loading_listview.dart';

class MenClothingTab extends StatefulWidget {
  const MenClothingTab({super.key});

  @override
  State<MenClothingTab> createState() => _MenClothingTabState();
}

class _MenClothingTabState extends State<MenClothingTab> {
  CategoryViewModel categoryViewModel = CategoryViewModel();

  @override
  void initState() {
    categoryViewModel.getMenClothes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: categoryViewModel.menClothesLoading,
        builder: (context, isLoadingItems, _) {
          return isLoadingItems
              ? const ItemsLoadingListView(
                  itemCount: 4,
                )
              : ValueListenableBuilder(
                  valueListenable: categoryViewModel.menClothesNotifier,
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
                    );
                  });
        });
  }
}
