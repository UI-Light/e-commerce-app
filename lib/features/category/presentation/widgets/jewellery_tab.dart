import 'package:flutter/material.dart';
import 'package:shopping_app/core/presentation/widgets/products_box.dart';
import 'package:shopping_app/features/category/presentation/view_model/category_view_model.dart';
import 'package:shopping_app/features/category/presentation/widgets/items_loading_listview.dart';

class JewelleryTab extends StatefulWidget {
  const JewelleryTab({super.key});

  @override
  State<JewelleryTab> createState() => _JewelleryTabState();
}

class _JewelleryTabState extends State<JewelleryTab> {
  CategoryViewModel categoryViewModel = CategoryViewModel();

  @override
  void initState() {
    categoryViewModel.getJewellery();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: categoryViewModel.jewelleryLoading,
        builder: (context, isLoadingItems, _) {
          return isLoadingItems
              ? const ItemsLoadingListView(
                  itemCount: 4,
                )
              : ValueListenableBuilder(
                  valueListenable: categoryViewModel.jewelleryNotifier,
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
