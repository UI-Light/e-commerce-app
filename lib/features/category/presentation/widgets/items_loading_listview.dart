import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopping_app/features/home/presentation/widgets/product_loading_box.dart';

class ItemsLoadingListView extends StatelessWidget {
  final int itemCount;
  const ItemsLoadingListView({
    super.key,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: GridView.builder(
          itemCount: itemCount,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 6,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
          ),
          itemBuilder: (context, _) {
            return const ProductLoadingBox();
          },
        ));
  }
}
